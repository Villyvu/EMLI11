#!/bin/bash

url="http://192.168.10.185/led/a/yellow/status"
response=$(curl "$url")

if [ "$response" -eq 1 ]; then
	mosquitto_pub -h localhost -p 1883 -u my_user -P embeddedlinux -t my_user/command/pump -m "pump"
fi
