#!/bin/bash
sudo sysctl -w net.ipv4.ip_forward=1

sudo /home/pi/emli_project/pump_sub.sh &
sudo /home/pi/emli_project/publish_data.sh &
sudo /home/pi/emli_project/subscribe_data.sh &
sudo /home/pi/emli_project/check_button.sh &
sudo /home/pi/emli_project/led_sub.sh &

