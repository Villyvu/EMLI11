#!/bin/bash

cpu_temperature=$(vcgencmd measure_temp | awk -F "=" '{print $2}' | awk -F "'" '{print $1}')

echo "CPU temp: $cpu_temperature C"
