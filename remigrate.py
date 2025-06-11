

# import necessary modules
import os
import sys 
import django
import pyodbc
from django.core.management import call_command
import configparser
import datetime

# read the settings.ini file
config = configparser.ConfigParser()
config.read("settings.ini")

# set the project name
project_name = config["project"]["name"]

# set the database connection string
server_name = config["database"]["server_name"]
database_name = config["database"]["database_name"]
user_name = config["database"]["user_name"]
password = config["database"]["password"]
connection_string = f"DRIVER={{SQL Server}};SERVER={server_name};DATABASE={database_name};UID={user_name};PWD={password}"




os.environ.setdefault("DJANGO_SETTINGS_MODULE", "core.settings")

# check the value of DJANGO_SETTINGS_MODULE
print(os.environ.get("DJANGO_SETTINGS_MODULE"))


# setup the django environment
django.setup()

# connect to MS SQL Server database
cnxn = pyodbc.connect(
    connection_string
)


    

# create list of the sql files to be executed
sql_list = [ 
    "droptables.sql",
    # "create_views_and_functions.sql",
]

# set the path to the directory that contains the .sql files
sql_path = os.getcwd() + "\sql\\"

# execute the sql files
with cnxn.cursor() as cursor:
    for sql_file in sql_list:
        with open(sql_path + sql_file, "r") as f:
            sql_code = f.read()
        cursor.execute(sql_code)
        print(f"Executed {sql_file}")

print("All sql files executed successfully.")

# clear out migration history
call_command("migrate", "--fake", "rm97", "zero")


# remove the old migrations .py files, if migrations directory exists
if os.path.exists("rm97/migrations"):
    file_list = os.listdir("rm97/migrations")
    for file in file_list:
        if file.startswith("__"):
            continue
        else:
            os.remove(f"rm97/migrations/{file}")
else:
    print("migrations directory does not exist")

# makemigrations and migrate the new tables
call_command("makemigrations", "rm97")
call_command("migrate", "rm97")


# MOVE TO SUPPORT TABLES SQL FILES


# # create list of the contact types to be inserted
# contact_types = [
#     "Operations/Service",
#     "A/P Contact",
#     "Other Contact",

# ]

# # insert the contact types into the database
# with cnxn.cursor() as cursor:
#     for contact_type in contact_types:
#         cursor.execute(
#             "INSERT INTO ContactType (Type) VALUES (?)", contact_type
#         )
#         print(f"Inserted {contact_type}")

# create list of the populate customers sql files to be executed
sql_list = [
    # "supporttables.sql",
    # "NextBillingDates.sql",
    # "customers.sql", # Review this file for grandchild accounts and billing addresses
    # "update_migration_status.sql",
    # "update_billing_info.sql",
    # "populate_customers.sql",
    # "populate_customer_locations.sql",
    # "customer_headquarters_billing.sql",
    # "populate_contacts.sql",
    # "build_routes.sql",
    # "populate_routing.sql",
    # "populate_routes.sql",
    # "populate_call_log.sql",
    # "populate_aged_debtors.sql",
    # "active_auto.sql",
    # "service_agreements.sql",
    # "site_order_header.sql",
    # "site_order_rental.sql",
    # "site_order_assignments.sql",
    # "populate_container_template.sql",
    # "final_updates.sql",

]

# set the path to the directory that contains the .sql files
sql_path = os.getcwd() + "\sql\\"
start_time = datetime.datetime.now()
# execute the sql files
with cnxn.cursor() as cursor:
    for sql_file in sql_list:
        with open(sql_path + sql_file, "r") as f:
            sql_code = f.read()
        cursor.execute(sql_code)
        print(f"Executed {sql_file}")

print("All sql files executed successfully.")
end_time = datetime.datetime.now()
print(f"Time taken to execute the sql files: {end_time - start_time}")





