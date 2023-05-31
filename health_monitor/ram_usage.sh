#!/bin/bash

ram_usage=$(free | awk '/Mem/ {printf("%.2f", ($4/$2)*100)}')

echo "RAM usage: $ram_usage%"
