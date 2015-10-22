#!/bin/bash

/bitshares-2/programs/witness_node/witness_node \
                       --p2p-endpoint="0.0.0.0:9090" \
                       --data-dir=/data_trusted_node/ \
                       --rpc-endpoint="127.0.0.1:8090"
