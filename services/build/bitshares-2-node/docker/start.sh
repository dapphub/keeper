#!/bin/bash

# compose configuration
cat /data_witness_node/default.ini /conf/witness/witness.conf > /data_witness_node/config.ini

cat /data_witness_node/config.ini

/bitshares-2/programs/witness_node/witness_node \
                       --p2p-endpoint="0.0.0.0:9090" \
                       --rpc-endpoint="0.0.0.0:8090" \
                       --data-dir=/data_witness_node/
