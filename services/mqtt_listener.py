import asyncio
import json
import os
import paho.mqtt.client as mqtt

ALERTS = []

def on_message(client, userdata, msg):
    try:
        data = json.loads(msg.payload.decode())
        if data.get("type") == "new":
            ALERTS.append(data)
    except Exception as e:
        print(f"Error decoding MQTT message: {e}")

def start_mqtt():
    broker = os.getenv("MQTT_HOST", "localhost")
    port = int(os.getenv("MQTT_PORT", 1883))
    topic = os.getenv("MQTT_TOPIC", "frigate/events")
    user = os.getenv("MQTT_USER")
    password = os.getenv("MQTT_PASSWORD")

    client = mqtt.Client()
    if user and password:
        client.username_pw_set(user, password)
    client.on_message = on_message
    client.connect(broker, port, 60)
    client.subscribe(topic)
    client.loop_start()
