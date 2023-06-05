#!/bin/bash


MQTT_USERNAME="my_user"
MQTT_PASSWORD="embeddedlinux"
MQTT_PUMP="my_user/command/pump"
MQTT_ADDRESS="localhost"
MQTT_PORT=1883

while true; do

	message=$(mosquitto_sub -h $MQTT_ADDRESS -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -t $MQTT_PUMP -C 1)

	url="http://192.168.10.185/led/a/red/status"
	response=$(curl "$url")

	if [[ "$message" -eq "1" && "$response" -eq 0 ]]; then
		echo p > /dev/ttyACM0
	fi

done


