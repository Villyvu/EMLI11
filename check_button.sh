while true; do

	response=$(curl "http://192.168.10.185/button/a/count")


	if [ "$response" -gt 0 ]; then
		echo "PUMP"
		mosquitto_pub -h localhost -p 1883 -u my_user -P embeddedlinux -t my_user/command/pump -m "pump"		
	fi

	sleep 2	
done
