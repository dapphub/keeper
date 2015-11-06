#!/bin/bash

if [ -e "/conf/muse-cli-wallet/wallet.json" ]; then
 echo "Copying predefined wallet.json file"
 cp -v /conf/muse-cli-wallet/wallet.json /wallet.json
fi

if [ -n "$NODE_PORT_8090_TCP_ADDR" ]; then
 env
 /muse/programs/cli_wallet/cli_wallet \
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
