#!/bin/bash

# Path to the USB port
usb_port="/dev/ttyACM0"

# Read from the USB port
read data < "$usb_port"

# Extract the third value from the data
IFS=',' read -ra values <<< "$data"
third_value="${values[2]}"

# Output the third value
echo "Third value: $third_value"

