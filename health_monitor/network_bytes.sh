#!/bin/bash


interface="wlan0"
rx_bytes=$(/sbin/ifconfig "$interface" | awk '/RX packets/ {print $6}')
tx_bytes=$(/sbin/ifconfig "$interface" | awk '/TX packets/ {print $6}')

info_string="Interface: $interface, RX Bytes: $rx_bytes, TX Bytes: $tx_bytes"

echo "Information string: $info_string"


