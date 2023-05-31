#!/bin/bash

# Get the network interface name


# Run ifconfig command and extract network bytes values
interface="wlan0"
rx_bytes=$(/sbin/ifconfig "$interface" | awk '/RX packets/ {print $6}')
tx_bytes=$(/sbin/ifconfig "$interface" | awk '/TX packets/ {print $6}')

# Create string with network bytes values
info_string="Interface: $interface, RX Bytes: $rx_bytes, TX Bytes: $tx_bytes"

echo "Information string: $info_string"


