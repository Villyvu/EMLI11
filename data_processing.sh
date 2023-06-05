#!/bin/bash

# Set the MQTT broker address and port
MQTT_ADDRESS="localhost"
MQTT_PORT=1883

MQTT_USERNAME="my_user"
MQTT_PASSWORD="embeddedlinux"
# Set the MQTT topic to subscribe to
MQTT_TOPIC="my_user/data"
MQTT_MOISTURE="my_user/moisture_level"
MQTT_PLANT_ALARM="my_user/plant_water_alarm"
MQTT_PUMP_ALARM="my_user/pump_water_alarm"
MQTT_AMBIENT="my_user/ambient_light"


# Subscribe to the MQTT topic and print the received messages
mosquitto_sub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_TOPIC | while read message; do
    echo "Received message: $message"
    plant_water_alarm=$(echo "$message" | cut -d',' -f1 | cut -d'(' -f2)
    pump_water_alarm=$(echo "$message" | cut -d',' -f2)
    soil_moisture=$(echo "$message" | cut -d',' -f3)
    ambient_light=$(echo "$message" | cut -d',' -f4 | cut -d')' -f1)

    mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_MOISTURE -m $soil_moisture
    mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_PLANT_ALARM -m $plant_water_alarm
    mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_PUMP_ALARM -m $pump_water_alarm
    mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_AMBIENT -m $ambient_light
    
done
