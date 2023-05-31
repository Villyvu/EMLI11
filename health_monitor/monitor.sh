#!/bin/bash

DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN

log_file="health_metrics.log" 

disk_space=$(./disk_space.sh)
ram_usage=$(./ram_usage.sh)
cpu_load=$(./cpu_load.sh)
cpu_temperature=$(./cpu_temp.sh)
network_bytes=$(./network_bytes.sh)

{
    echo "Date: $(date) "
    echo "$disk_space"
    echo "$ram_usage"
    echo "$cpu_load"
    echo "$cpu_temperature"
    echo "$network_bytes"
} >> "$log_file"

