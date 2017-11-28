#!/bin/bash

#@author: Carlos Viescas, Bartolome Jimenez

echo "Running Portfolio 2 Assignment - LEO1"
echo " "
./jumper.sh > DHCP_state &
echo "DHCP server programm started"
python text_scroll_publisher.py &
echo "Text scroll is running"
python joystick_events.py &
echo "Joystick-event reading  program is running"
exit 0
