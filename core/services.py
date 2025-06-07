from modules.sqlaction import SqlAction
from modules.serviceprocessor import ServiceProcessor
from modules.dataaction import DataAction
from modules.extractexcel import Extract
import configparser


sql = SqlAction()

sql.execute_sql_file("active_auto_details.sql")

da = DataAction("settings.ini")
query = "SELECT ServiceCode [service_key], ServiceDescription [service_value] FROM ServicesHeader"

service_df = da.fetch_data_from_db(query)
# print(service_df)
# print(service_df.set_index('service_key').to_dict('index'))

service_dict = service_df.set_index('service_key')['service_value'].to_dict()
# print(service_dict)

# Process the services
# processor = ServiceProcessor(service_df.set_index('service_key').to_dict('index'))
processor = ServiceProcessor(service_dict)
result_dict = processor.process_services()

# print(result_dict)

create_table_query = '''
    CREATE TABLE ServiceDetail (
        name NVARCHAR(255) PRIMARY KEY,
        description NVARCHAR(255),
        size NVARCHAR(255),
        unit NVARCHAR(255),
        action NVARCHAR(255),
        frequency NVARCHAR(255),
        container NVARCHAR(255)
    )
    '''

sql.write_dict_to_sql_server(result_dict, create_table_query)

sql.execute_sql_file("write_service_details.sql")

config = configparser.ConfigParser()
config.read("settings.ini")

project_name = config["project"]["name"]

raw_queries = [
        (
            f"""select *, '{project_name}' as Project, getdate() as Timestamp from ServiceCodeDetail""",
            "ServiceCodeDetail",
        )
    ]

extract = Extract(raw_queries, "ServiceCodeDetails.xlsx")
extract.extract_data_to_excel()