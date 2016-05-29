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
    make -C keeper build start

Currently, only one Keeper daemon is available (Feedbase); it will be
started automatically if you have configured it in `~/.keeper.json`.

There is also a simple utility for fetching price feeds from Poloniex,
which can be used in combination with the Feedbase daemon.

If you want, you can also run Keeper directly, without using Docker,
as long as you have all the dependencies installed (see `Dockerfile`):

    bin/keeper poloniex
    bin/keeper feedbase-daemon

The same configuration file (`~/.keeper.json`) is used in both cases.


Feedbase
--------

Feedbase is a simple smart contract that lets anyone publish price
feeds to the Ethereum blockchain.

Before you can use this daemon, you will need to claim your feed IDs.
Please see <https://github.com/nexusdev/feedbase> for more details.

The daemon works as a simple loop which periodically updates a set of
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

This daemon connects to the Ethereum node at `http://localhost:8545`
by default.  To change this, please set the variable `ETH_RPC_URL`.

Currently, only one Ethereum account can be used to publish values,
specified by the `ETH_ACCOUNT` variable; this account must be the
owner of all the price feeds.

[TODO: Automatically use the correct account for each feed.]
