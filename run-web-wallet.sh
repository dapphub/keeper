#!/bin/bash

docker run $* -d --name cli-wallet \
           --link trusted-full-node \
           -p 80:80 \
           -v $PWD/web-wallet-data/www:/www \
           -v $PWD/web-wallet-data/conf:/conf \
           bitshares/bitshares-2-webwallet
