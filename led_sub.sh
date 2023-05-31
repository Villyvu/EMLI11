#!/bin/bash

MQTT_USERNAME="my_user"
MQTT_PASSWORD="embeddedlinux"
MQTT_LED="my_user/command/led"
MQTT_ADDRESS="localhost"
MQTT_PORT=1883

while true; do

    message=$(mosquitto_sub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_LED -C 1)

    if [[ "$message" -eq "GREEN ON" ]]; then
        curl "http://192.168.10.185/led/green/on"

    elif [[ "$message" -eq "GREEN OFF" ]]; then
        curl "http://192.168.10.185/led/green/off"

    elif [[ "$message" -eq "RED ON" ]]; then
        curl "http://192.168.10.185/led/red/on"
    elif [[ "$message" -eq "RED OFF" ]]; then
        curl "http://192.168.10.185/led/red/off"

    elif [[ "$message" -eq "YELLOW ON" ]]; then
        curl "http://192.168.10.185/led/yellow/on"
    elif [[ "$message" -eq "YELLOW OFF" ]]; then
        curl "http://192.168.10.185/led/yellow/off"
    fi

done
