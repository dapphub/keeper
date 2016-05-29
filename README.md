Keeper
======

Keeper is an admin toolkit for incentive-following software daemons.
Each Keeper daemon may depend on any of the common infrastructure
services and utilities provided by the Keeper framework.

Examples of incentivised behavior include mining, staking, witnessing,
or otherwise producing blocks, publishing price feeds, or poking smart
contract systems such as Maker or the Ethereum Alarm Clock.

Since most keepers want to run as many profitable daemons as possible,
writing a Keeper daemon is a good way to ensure that any theoretically
incentivized actions presented by your system actually get executed.


Getting started
---------------

To start Keeper with the default set of daemons:

    git clone https://github.com/nexusdev/keeper
    cd keeper
    docker-compose up

If you have all the dependencies installed (see `Dockerfile`), you can
also just run Keeper directly:

    bin/keeper poloniex
    bin/keeper feedbase-daemon

The same configuration file (`~/.keeper.json`) is used in both cases.


Feedbase
--------

Feedbase is a simple smart contract that lets anyone publish price
feeds to the Ethereum blockchain.

This daemon works as a simple loop which periodically updates a set of
feeds specified in `~/.keeper.json`, as in the following example:

    {
      "feedbase": {
        "feeds": {
          "37": {
            "command": "keeper price poloniex BTC_DOGE",
            "type": "ufixed128x128",
            "expiration": 120,
            "interval": 60
          },
          "38": {
            "command": "keeper price poloniex XMR_LTC",
            "type": "ufixed192x64",
            "expiration": 300,
            "interval": 120
          }
        }
      }
    }

By default, the Ethereum node at `http://localhost:8545` is used.
To change this, please set the variable `ETH_RPC_URL`.  Currently,
only one Ethereum account (specified by the `ETH_ACCOUNT` variable)
can be used.  This account must be the owner of all the price feeds.

Each value will be automatically converted into fixed-point notation
according to the value of the `type` option for the feed in question.

Of course, you need to your feed IDs before you can publish to them.
See <https://github.com/nexusdev/feedbase> for more details.
