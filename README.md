Keeper
====================

Keepers are software agents which contribute to various distributed systems. Each individual keeper is a low-trust contributor. Keeper nodes publish statistics, but these should not be consumed by any blockchain validation logic.

Step-By-Step
------------

    docker-compose up node
    docker-compose up cli-wallet
    docker-compose up price-feeds
    docker-compose up delayed-node
    docker-compose up ipfs

BitShares 2.0 Fullnode/Witness
------------------------------
 * Configuration `conf/witness/witness.conf`
 * If configuration is set for block producing, then the node will be a block
   producing witness node
 * `docker-compose up node`

BitShares 2.0 Cli-Wallet
-------------------------
 * Wallet file `conf/cli-wallet/wallet.json`
 * RPC port 8092 at localhost
 * requires password to unlock the wallet.json
 * `docker-compose up cli-wallet`

BitShares 2.0 Price Feeds
-------------------------
 * Configuration `conf/pricefeed/config.py`
 * Requires the unlock password for the cli-wallet's wallet
 * `docker-compose up price-feeds`

IPFS
----
 * Files are shared in the volume `conf/ipfs/data`
 * To add new files into ipfs use `conf/ipfs/export`:

    cp file conf/ipfs/export
    docker exec $keeper_ipfs ipfs add /export/file

 * Pinned files can be listed with

    docker exec $keeper_ipfs ipfs pin ls

Wish list
---------
 * ethereum full node
 * tor
 * arbitrage bot
 * market-maker
 * collateral redeemer
 * nubits liquidity bot
 * ripple liquidity bot
