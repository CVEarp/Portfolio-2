#!/usr/bin/python

from sense_hat import SenseHat
import socket

sense = SenseHat()

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', 8888))

while True:
    for event in sense.stick.get_events():
        if event.action == 'pressed':
            s.send(event.direction)
            # print (event.direction, event.action)



