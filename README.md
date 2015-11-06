Keeper
======

Keepers are software agents which contribute to various distributed systems.
Each individual keeper is a low-trust contributor. Keeper nodes publish
statistics, but these should not be consumed by any blockchain validation
logic.

Building bitshares-2 and muse base containers
---------------------------------------------

    docker -t bitshares/bitshares-2 build/bitshares-2
    docker -t muse/muse build/muse

Graphene Fullnode/Witness
------------------------------
 * (optional) If you want to produce blocks and have shareholder approval for
   your witness, then you need to configure your node for block production by
   adding the witness-id and the public/private-key to the configuration file.

   * BitShares 2.0: `conf/witness/witness.conf`
   * MUSE: `conf/muse-witness/witness.conf`
     
     # ID of witness controlled by this node (e.g. "1.6.5", quotes are required, may specify multiple times)
     witness-id = "1.6.5"
     # Tuple of [PublicKey, WIF private key] (may specify multiple times)
     private-key = ["BTS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"]

 * Run the node/witness:
 
   * BitShares 2.0: `docker-compose up node`
   * MUSE: `docker-compose up muse-node`

CLI-Wallet
-------------------------
 1. Prepare your `wallet.json` file using the regular CLI-wallet

    * For block production: Import you witnesses private key to sign price
      feeds later
    * For exchanges: Import your account's *active* key to allow spending funds

 2. Put the wallet.json file into the correct condiguration directory:

    * BitShares 2.0: `conf/cli-wallet/wallet.json`
    * MUSE: `conf/muse-cli-wallet/wallet.json`
 
 3. Running: `docker-compose up cli-wallet`
 4. This container opens a RPC port 8092 for localhost
 5. It requires unlocking of the wallet file via RPC

Price Feeds
-------------------------
 1. Configuration:

   * BitShares 2.0: `conf/pricefeed/config.py`

 2. Running: `docker-compose up price-feeds`
 3. It requires unlocking of the wallet file via RPC

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
