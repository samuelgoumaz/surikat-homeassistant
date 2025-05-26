from flask import Flask
import paho.mqtt.client as mqtt
import threading
import os
import re

# Parsing de l'URL (si mqtt://...)
mqtt_url = os.getenv("MQTT_HOST", "mqtt://localhost")
host_match = re.match(r"^mqtt:\/\/(.+)$", mqtt_url)
MQTT_HOST = host_match.group(1) if host_match else mqtt_url

MQTT_PORT = int(os.getenv("MQTT_PORT", 1883))
MQTT_TOPIC = os.getenv("MQTT_TOPIC", "frigate/events")
MQTT_USER = os.getenv("MQTT_USER", "")
MQTT_PASSWORD = os.getenv("MQTT_PASSWORD", "")

app = Flask(__name__)

@app.route("/")
def index():
    return "MQTT Flask Addon actif ✅"

def on_connect(client, userdata, flags, rc):
    print(f"✅ Connecté à MQTT avec code {rc}")
    client.subscribe(MQTT_TOPIC)
    print(f"📡 Abonné au topic {MQTT_TOPIC}")

def on_message(client, userdata, message):
    print(f"📥 {message.topic}: {message.payload.decode()}")

def mqtt_thread():
    client = mqtt.Client()
    client.username_pw_set(MQTT_USER, MQTT_PASSWORD)
    client.on_connect = on_connect
    client.on_message = on_message
    client.connect(MQTT_HOST, MQTT_PORT)
    client.loop_forever()

if __name__ == "__main__":
    threading.Thread(target=mqtt_thread, daemon=True).start()
    app.run(host="0.0.0.0", port=5000)
