#!/bin/bash

if [ -n "$TRUSTED_FULL_NODE_PORT_8090_TCP_ADDR" ]; then
 /bitshares-2/programs/delayed_node/delayed_node \
                        --data-dir=/data_delayed_node/ \
                        --trusted-node="$TRUSTED_FULL_NODE_PORT_8090_TCP_ADDR:$TRUSTED_FULL_NODE_PORT_8090_TCP_PORT" \
                        --rpc-endpoint="0.0.0.0:8091" \
                        -s "0.0.0.0:0" \
                        --p2p-endpoint="0.0.0.0:0" \
                        --seed-nodes "[]"
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
