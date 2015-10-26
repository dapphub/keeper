#!/bin/bash

if [ -n "$NODE_PORT_8090_TCP_ADDR" ]; then
 /bitshares-2/programs/delayed_node/delayed_node \
                        --data-dir=/data_delayed_node/ \
                        --trusted-node="$NODE_PORT_8090_TCP_ADDR:$NODE_PORT_8090_TCP_PORT" \
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
           --link node 
Otherwise it will not connect properly!
EOF

fi
