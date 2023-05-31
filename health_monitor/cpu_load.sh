#!/bin/bash

# Get current CPU load in percent
cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo "CPU load: $cpu_load%"
