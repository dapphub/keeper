#!/bin/bash

docker run $* --name delayed-node \
           --link trusted-full-node \
           -p 127.0.0.1:8091:8091 \
           bitshares/bitshares-2-delayed-node
