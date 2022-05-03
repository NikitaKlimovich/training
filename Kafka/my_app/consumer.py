from kafka import KafkaConsumer
import csv
import ast

consumer = KafkaConsumer(
    "course-topic",
    bootstrap_servers = ["localhost:9092"],
    auto_offset_reset = "latest",
    enable_auto_commit = True,
    group_id = "example_group"
)
header = ['NAME','ADDRESS','CREATED_AT']
try:
    file = open('my_task.csv','r')
    file.close()
except:
    with open ('my_task.csv','w',encoding='utf-8') as file:
        writer = csv.DictWriter (file, fieldnames=header)
        writer.writeheader()
for message in consumer:
    with open ('my_task.csv','a',encoding='utf-8') as file:
        writer = csv.DictWriter (file, fieldnames=header)
        print(message.value)
        writer.writerow(ast.literal_eval(message.value.decode('utf-8')))