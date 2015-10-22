#!/bin/bash

/bitshares-2/programs/delayed_node/delayed_node \
                       --data-dir=/data_delayed_node/ \
                       --trusted-node="127.0.0.1:8090" \
                       --rpc-endpoint="127.0.0.1:8091"
                       -s "0.0.0.0:0" \
                       --p2p-endpoint="0.0.0.0:0" \
                       --seed-nodes "[]"
