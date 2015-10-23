#!/bin/bash

if [ -n "$TRUSTED_FULL_NODE_PORT_8090_TCP_ADDR" ]; then
 /bitshares-2/programs/cli_wallet/cli_wallet \
                        -s ws://${TRUSTED_FULL_NODE_PORT_8090_TCP_ADDR}:${TRUSTED_FULL_NODE_PORT_8090_TCP_PORT} \
                        -H 0.0.0.0:8092 \
                        -d 
else
 cat << EOF
######################
## Configuration Error
######################
This docker has to be linked to a full-node with
           --link trusted-full-node 
Otherwise it will not connect properly!
EOF

fi
