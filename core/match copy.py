import pandas as pd
from sqlalchemy import create_engine, text
import configparser
from datetime import datetime
import pyodbc

# Read the settings.ini file
config = configparser.ConfigParser()
config.read('settings.ini')

# Extract database connection settings

server = config["database"]["server_name"]
database = config["database"]["database_name"]
username = config["database"]["user_name"]
password = config["database"]["password"]

# Create the connection string
connection_string = (
    f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver=SQL+Server"
)

# Create an engine
engine = create_engine(connection_string)

# Read the Containers and Services tables into dataframes
# dfContainers = pd.read_sql_query("select * from CANGSizeFrequency where c_id = 209925", engine) # pd.read_sql_table("CANGSizeFrequency", engine)
# dfServices = pd.read_sql_query("select * from ServicesSizeFrequency where c_id = 209925", engine) # pd.read_sql_table("ServicesSizeFrequency", engine)
dfContainers = pd.read_sql_query("select * from CANGSizeFrequency", engine) 
dfServices = pd.read_sql_query("select * from ServicesSizeFrequency", engine) 

# Ensure that the 'c_id', 'Size', and 'Frequency' columns are of the same data type
dfContainers['c_id'] = dfContainers['c_id'].astype(str)
dfServices['c_id'] = dfServices['c_id'].astype(str)

dfContainers['Size'] = dfContainers['Size'].astype(str)
dfServices['Size'] = dfServices['Size'].astype(str)

dfContainers['Frequency'] = dfContainers['Frequency'].astype(str)
dfServices['Frequency'] = dfServices['Frequency'].astype(str)

dfContainers['Type'] = dfContainers['Type'].astype(str)
dfServices['Type'] = dfServices['Type'].astype(str)


# Initialize an empty dataframe for matches
dfMatch = pd.DataFrame(columns=['AUTOID', 'CONGRPUID'])

# record the start time of the matching process
start_time = datetime.now()

# Iterate through each record in dfContainers
for index, service in dfServices.iterrows():
    # Find the first matching record in dfServices
    match = dfContainers[
        (dfContainers['c_id'] == service['c_id']) &
        (dfContainers['Size'] == service['Size']) &
        (dfContainers['Frequency'] == service['Frequency']) &
        (dfContainers['Quantity'] >= service['quantity'])
    ].head(1)

    # If a match is found, process the match
    if not match.empty:
        match_index = match.index[0]
        dfMatch = dfMatch._append({
            'CONGRPUID': match.at[match_index, 'CONGRPUID'],
            'AUTOID': service['AUTOID']
        }, ignore_index=True)
        
        # Update the matched service quantity
        dfServices.at[match_index, 'Quantity'] -= service['quantity']


# Second loop: Match on c_id, Size, and Quantity requirements (excluding matched containers)
for index, container in dfContainers.iterrows():
    if not dfMatch[dfMatch['CONGRPUID'] == container['CONGRPUID']].empty:
        continue
    
    match = dfServices[
        (dfServices['c_id'] == container['c_id']) &
        (dfServices['Size'] == container['Size']) &
        (dfServices['Quantity'] >= container['quantity'])
    ].head(1)

    if not match.empty:
        match_index = match.index[0]
        dfMatch = dfMatch._append({
            'AUTOID': match.at[match_index, 'AUTOID'],
            'CONGRPUID': container['CONGRPUID']
        }, ignore_index=True)
        
        dfServices.at[match_index, 'Quantity'] -= container['quantity']

# third loop: Match on c_id, frequency, type, and Quantity requirements (excluding matched containers)
for index, container in dfContainers.iterrows():
    if not dfMatch[dfMatch['CONGRPUID'] == container['CONGRPUID']].empty:
        continue
    
    match = dfServices[
        (dfServices['c_id'] == container['c_id']) &
        (dfServices['Frequency'] == container['Frequency']) &
        (dfServices['Type'] == container['Type']) &
        (dfServices['Quantity'] >= container['quantity'])
    ].head(1)

    if not match.empty:
        match_index = match.index[0]
        dfMatch = dfMatch._append({
            'AUTOID': match.at[match_index, 'AUTOID'],
            'CONGRPUID': container['CONGRPUID']
        }, ignore_index=True)
        
        dfServices.at[match_index, 'Quantity'] -= container['quantity']        

# Display the matched dataframe
print(dfMatch)    

# Calculate the time taken to match the records
end_time = datetime.now()
time_taken = end_time - start_time
print(f"Time taken to match records: {time_taken}")


# write to database
connection_string = f"DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}"

cnxn = pyodbc.connect(
    connection_string
)

cursor = cnxn.cursor()

sql_code = """drop table if exists Matches;"""
cursor.execute(sql_code)
cnxn.commit()


sql_code = """create table Matches (
AUTOID INT,
CONGRPUID INT
);"""
cursor.execute(sql_code)
cnxn.commit()


# Insert Dataframe into SQL Server:
for index, row in dfMatch.iterrows():
     cursor.execute("INSERT INTO Matches (AUTOID,CONGRPUID) values(?,?)", row.AUTOID, row.CONGRPUID)
cnxn.commit()
cursor.close()
