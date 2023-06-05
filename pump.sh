#!/bin/bash

mosquitto_pub -h localhost -p 1883 -u my_user -P embeddedlinux -t my_user/command/pump -m "1"
