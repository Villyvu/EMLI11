#!/bin/bash

cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo "CPU load: $cpu_load%"
