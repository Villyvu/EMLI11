#!/bin/bash

# Get available disk space in percent
disk_space=$(df -h / | awk 'NR==2 {print $5}')

echo "Available disk space: $disk_space"
