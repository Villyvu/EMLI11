#!/bin/bash

# Set the MQTT broker address and port
MQTT_ADDRESS="localhost"
MQTT_PORT=1883
MQTT_USERNAME="my_user"
MQTT_PASSWORD="embeddedlinux"
# Set the MQTT topic to subscribe to
MQTT_TOPIC="my_user/data"
MQTT_LED="my_user/command/led"


# Subscribe to the MQTT topic and print the received messages
mosquitto_sub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_TOPIC | while read message; do
    echo "Received message: $message"
    plant_water_alarm=$(echo "$message" | cut -d',' -f1 | cut -d'(' -f2)
    pump_water_alarm=$(echo "$message" | cut -d',' -f2)
    soil_moisture=$(echo "$message" | cut -d',' -f3)
    ambient_light=$(echo "$message" | cut -d',' -f4 | cut -d')' -f1)


    if [[ "$plant_water_alarm" -eq 1 || "$pump_water_alarm" -eq 1 ]]; then
        mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_LED -m "RED ON"
    else
        mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_LED -m "RED OFF"
    fi

    # Turn on the yellow LED if the soil moisture is less than 30
    if [[ "$soil_moisture" -lt 30 ]]; then
        mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_LED -m "YELLOW ON"

    else
        mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_LED -m "YELLOW OFF"
    fi

    # Turn on the green LED if neither the red nor yellow LEDs are on
    # Turn on the green LED if neither the red nor yellow LEDs are on
    if [[ "$soil_moisture" -gt 30 && "$plant_water_alarm" -eq 0 && "$pump_water_alarm" -eq 0 ]]; then
        mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_LED -m "GREEN ON"
    else
        mosquitto_pub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_LED -m "GREEN OFF"
    fi

done
