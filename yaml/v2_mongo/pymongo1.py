from pymongo import MongoClient

client = MongoClient('mongodb://adminuser:password123@192.168.49.2:32000')

db_list = client.list_database_names()

print("Список доступных баз данных:")
for db_name in db_list:
    print(db_name)


# export MONGODB_CONN_STR=mongodb://adminuser:password123@192.168.49.2:32000

# mongodb://username:password@localhost:27017/mydatabase
# 192.168.49.2', 30000

# kubectl set env deployment/auth-server MONGODB_CONN_STR=<your_mongodb_connection_string>
# kubectl set env deployment/auth-server TIMESERVER_URL=<your_mongodb_connection_string> 
# 35.184.35.71
# kubectl set env deployment/auth-server TIMESERVER_URL=35.184.35.71:8001
    