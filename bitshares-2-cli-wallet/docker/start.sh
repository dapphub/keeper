#!/bin/bash

/bitshares-2/programs/cli_wallet/cli_wallet \
                       -s ws://${TRUSTED_FULL_NODE_PORT_8090_TCP_ADDR}:${TRUSTED_FULL_NODE_PORT_8090_TCP_PORT} \
                       -H 0.0.0.0:8092 \
                       -d 
