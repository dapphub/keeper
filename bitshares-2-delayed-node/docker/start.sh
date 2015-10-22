#!/bin/bash

/bitshares-2/programs/delayed_node/delayed_node \
                       --data-dir=/data_delayed_node/ \
                       --trusted-node="$TRUSTED_FULL_NODE_PORT_8090_TCP_ADDR:$TRUSTED_FULL_NODE_PORT_8090_TCP_PORT" \
                       --rpc-endpoint="0.0.0.0:8091" \
                       -s "0.0.0.0:0" \
                       --p2p-endpoint="0.0.0.0:0" \
                       --seed-nodes "[]"
