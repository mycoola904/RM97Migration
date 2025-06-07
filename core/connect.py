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


# write to database
connection_string = f"DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}"

cnxn = pyodbc.connect(
    connection_string
)

cursor = cnxn.cursor()

sql_code = """drop table if exists Matches;"""
cursor.execute(sql_code)
cnxn.commit()



# Insert Dataframe into SQL Server:
for index, row in dfMatch.iterrows():
     cursor.execute("INSERT INTO Matches (AUTOID,CONGRPUID) values(?,?)", row.AUTOID, row.CONGRPUID)
cnxn.commit()
cursor.close()