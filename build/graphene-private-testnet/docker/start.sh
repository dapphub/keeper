#!/bin/bash

/graphene/programs/witness_node/witness_node \
                       --p2p-endpoint="0.0.0.0:9090" \
                       --data-dir=/data_witness_node/ \
                       --rpc-endpoint="0.0.0.0:8090" \
                       --enable-stale-production \
                       --witness-id \""1.6.0"\" \""1.6.1"\" \""1.6.2"\" \
                                    \""1.6.3"\" \""1.6.4"\" \""1.6.5"\" \
                                    \""1.6.6"\" \""1.6.7"\" \""1.6.8"\" \
                                    \""1.6.9"\" \""1.6.10"\" \
                       --private-key \
                       '["GPH6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"]'
