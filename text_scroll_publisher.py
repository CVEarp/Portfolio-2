#!/usr/bin/python

from sense_hat import SenseHat
import sys
import RPIO

sense = SenseHat()
sense.set_rotation(180)
red = (128, 0, 0)



def socket_callback(socket,msg):
    try:
            print msg
            sense.show_message(msg, text_colour=red)

                   
    except:
            print 'Fomato de mensaje erroneo', msg
            return
print '[running on DNS=rpileo1 port=8888] \n '               
RPIO.add_tcp_callback(8888,socket_callback,threaded_callback = False)
RPIO.wait_for_interrupts()

