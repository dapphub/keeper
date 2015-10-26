#!/bin/python

import os, sys, json

sys.path.append('/conf/pricefeed')
import config

config.host = os.environ['NODE_PORT_8090_TCP_ADDR']
config.port = os.environ['NODE_PORT_8090_TCP_PORT']

sys.path.append('/python-graphenelib/scripts/pricefeeds')

import pricefeeds

pricefeeds.update_price_feed()
while 1:
    pass
