Keeper
======
[![Slack Status](http://slack.makerdao.com/badge.svg)](https://slack.makerdao.com)

Keepers are software agents which follow incentives presented by various systems.

Keeper behavior is specified via **plugins**, which are scripts that can depend on **services**
managed by Keeper.

An example of a service is `web3`, which lets a plugin communicate with the Ethereum network.
An example of a plugin is `maker`, which performs incentivized margin calls for the Maker contract system on Ethereum.

Writing a keeper plugin is a good way to ensure that any theoretical incentivized actions which your
system presents actually get executed, since most Keepers want to run as many profitable plugins as possible.

Writing a plugin
---

A plugin is a folder in the global `{$KEEPER_ROOT}/plugins` directory which has
an `init.js` file and an optional `config.json` file. Keeper runs
each plugin's `init.js` once. For now, each plugin is responsible for its own scheduling
via `setInterval` or similar.

Here is simple example plugin which logs to the console once the block height has
exceeded the one specified in the config file.

`init.js`:

    // The first argument is the list of services your plugin depends on.
    // The second argument is a function which is run once on startup
    // once all services are initialized.
    keeper.register(["config", "web3"], function(config, web3) {
        var interval = setInterval(function() {
            if( web3.eth.blockNumber > config.minHeight ) {
                console.log( "Reached minimum blockheight." );
                interval.cancel(); // TODO how do you actually kill this?
            }
        }, 10000);
    });

`config.json`:

    {
        "minHeight": 100
    }


Services
---
These are services available right now:
* `config` - Load your plugin's config file.
* `web3` - communicate with Ethereum (eventually Whisper and Swarm)

There are plans for more:

* `ipfs` - Read and write to ipfs.
* `ee` - elastic-ethereum, an ElasticSearch-based off-chain indexing solution.
* `log` - A bunyan child log for your plugin.



Service Docker Images
===
Complete
---
* Graphene witness node (BTS2 and MUSE)
* Feed publishing (graphene only)

Wish list
---------
* IPFS (default pins)
* ethereum full node
* eth dapps:
   * piper's alarm
    * collateral redeemer
* tor
* arbitrage bot
* market-maker
* nubits liquidity bot
* ripple liquidity bot

Individual Images
===

Below are instructions for working with the docker images before they are properly service-ivized.

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

BTS Price Feeds
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


