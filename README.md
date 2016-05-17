Keeper
======

Keeper is an admin toolkit for incentive-following software agents.

These software agents, which follow incentives presented by various
systems (particularly blockchains), are referred to as "keepers."

The incentive-following behavior is specified via Keeper plugins,
which depend on common services managed by the Keeper framework.

Examples of common services include Ethereum, BitShares, IPFS or Tor.
Examples of incentivised behavior include publishing price feeds to
various blockchain systems or poking the Ethereum alarm clock.

Since most keepers want to run as many profitable plugins as possible,
writing a Keeper plugin is a good way to ensure that any theoretically
incentivized actions presented by your system actually get executed.

## Usage

To start a Keeper node with the default setup:

   $ make run

To run individual Keeper commands:

   $ bin/keeper help
