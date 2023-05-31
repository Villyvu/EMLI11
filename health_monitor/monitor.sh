#!/bin/bash

DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN

log_file="health_metrics.log"  # Name of the log file

# Execute disk_space.sh and capture the output
disk_space=$(./disk_space.sh)

# Execute ram_usage.sh and capture the output
ram_usage=$(./ram_usage.sh)

# Execute cpu_load.sh and capture the output
cpu_load=$(./cpu_load.sh)

# Execute cpu_temperature.sh and capture the output
cpu_temperature=$(./cpu_temp.sh)

# Execute network_bytes.sh and capture the output
network_bytes=$(./network_bytes.sh)

# Append the captured values to the log file
{
    echo "Date: $(date) "
    echo "$disk_space"
    echo "$ram_usage"
    echo "$cpu_load"
    echo "$cpu_temperature"
    echo "$network_bytes"
} >> "$log_file"

