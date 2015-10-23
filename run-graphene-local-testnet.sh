#!/bin/bash

docker run $* --name private-testnet \
           -p 9190:9090 \
           -p 8190:8090 \
           graphene/graphene-private-testnet
