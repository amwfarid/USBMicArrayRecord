import threading

import paho.mqtt.client as mqtt
import json
import os
import time

thread = 0

# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("audio_rec")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    msg = json.loads(msg.payload.decode("utf-8"))
    global thread
    if msg.get('signal_type') == 'start' and thread == 0:
        thread = threading.Thread(target=audioRecord, args=([msg]))
        thread.start()

    elif msg.get('signal_type') == 'stop':
        print("Stopping")
        if thread != 0:
            os.system('sh stop_recording.sh')
            thread = 0
            client.publish('stop_all', payload='stop')
        # exit()



def audioRecord(msg):
    os.system('sh multi_mic_record.sh')
    
    
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("lauria.informatik.privat", 1883, 60)

# Blocking call that processes network traffic, dispatches callbacks and
# handles reconnecting.
# Other loop*() functions are available that give a threaded interface and a
# manual interface.
client.loop_forever()
