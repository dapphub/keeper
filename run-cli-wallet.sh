#!/bin/bash

docker run $* --name cli-wallet \
           --link trusted-full-node \
           -p 127.0.0.1:8092:8092 \
           bitshares/bitshares-2-cli-wallet
