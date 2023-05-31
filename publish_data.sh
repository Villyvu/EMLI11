#!/bin/bash

# Set the MQTT broker address and port
MQTT_ADDRESS="localhost"
MQTT_PORT=1883

MQTT_USERNAME="my_user"
MQTT_PASSWORD="embeddedlinux"
# Set the MQTT topic to which the data will be published
MQTT_TOPIC="my_user/data"

# Set the serial port device name
SERIAL_PORT="/dev/ttyACM0"

# Connect to the MQTT broker
mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_TOPIC -r -n

# Read data from the serial port and publish it to the MQTT topic
while read -r line; do
    mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_TOPIC -m "$line"
done < <(cat $SERIAL_PORT)

