#!/bin/bash

docker run $* --name trusted-full-node \
           -p 9090:9090 \
           -p 8090:8090 \
           bitshares/bitshares-2-trusted-full-node
