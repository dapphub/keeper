#!/bin/python

import os, sys, json
import time, threading

try : 
    sys.path.append('/conf/pricefeed/')
    import config
except :
    print('Error loading config.py from conf/pricefeed/');
    sys.exit(1)

config.host   = os.environ['CLI_WALLET_PORT_8092_TCP_ADDR']
config.port   = os.environ['CLI_WALLET_PORT_8092_TCP_PORT']
config.user   = ""
config.passwd = ""

sys.path.append('/python-graphenelib/scripts/pricefeeds')

import pricefeeds

def try_update() :
    try :
        pricefeeds.update_price_feed()
    except Exception as e:
        print('Error raise when executing price feed script! Please check messages above! (%s)' % str(e));
    print("Running Feed script again in %d seconds" % config.timer_interval)
    threading.Timer(config.timer_interval, try_update).start()

try_update()
