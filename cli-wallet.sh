screen -dmS bitshares-2 -t cli-wallet \
     docker run -d -name cli-wallet \
                --link delayed-node \
                bitshares-2-cli-wallet
