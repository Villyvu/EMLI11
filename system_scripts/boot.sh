#!/bin/bash
sudo sysctl -w net.ipv4.ip_forward=1

sudo /home/pi/emli_project/pump_sub.sh &
sudo /home/pi/emli_project/publish_data.sh &
sudo /home/pi/emli_project/data_processing.sh &
sudo /home/pi/emli_project/handle_led.sh &
sudo /home/pi/emli_project/check_button.sh &
sudo /home/pi/emli_project/led_sub.sh &

