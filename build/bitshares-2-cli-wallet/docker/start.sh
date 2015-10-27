#!/bin/bash

if [ -e "/conf/cli-wallet/wallet.json" ]; then
 echo "Copying predefined wallet.json file"
 cp -v /conf/cli-wallet/wallet.json /wallet.json
fi

if [ -n "$NODE_PORT_8090_TCP_ADDR" ]; then
 env
 /bitshares-2/programs/cli_wallet/cli_wallet \
                        -s ws://${NODE_PORT_8090_TCP_ADDR}:${NODE_PORT_8090_TCP_PORT} \
                        -H 0.0.0.0:8092 \
                        -d 
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
