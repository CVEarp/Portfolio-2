#!/bin/bash

#@authors: Carlos Viescas, Bartolome Jimenez 

isServer=false
while [ "true" ]
do
	#Configuring to read pin 18 (gpio 24)
	val=$(</sys/class/gpio/gpio24/value)
	echo "I/O port 18 value: $val "
	if [ "$val" = 1 ]; then
	        if [ "$isServer" == false ]; then	
			echo "Starting DHCP server."
			service dnsmasq restart
			sleep 1
			echo "Pi's IP adress:"
			hostname -I | grep -o '192.168.137.2'
			echo " "
			isServer=true
		else
			echo "dnsmasq is running."
			echo " "
		fi
	else
		if [ "$isServer" == false ]; then
			echo "dnsmasq NOT running."
			echo " "
		else
			echo "Stopping DHCP server"
			service dnsmasq stop
			sleep 1
       			echo "Pi's IP adress:"
			hostname -I | grep -o '10.42.0.16'
			echo " "
		 	isServer=false
		fi	
	fi
	sleep 2
done

