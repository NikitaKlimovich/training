from kafka import KafkaProducer
from mock_data import get_user_auth_data
import json
import time

def json_serializer(data):
    return json.dumps(data).encode("utf-8")

producer = KafkaProducer(
    bootstrap_servers = ["localhost:9092"],
    value_serializer = json_serializer)

if __name__ == "__main__":
    while True :
        registered_user = get_user_auth_data()
        print(registered_user)
        producer.send("course-topic", registered_user)
        time.sleep(10)