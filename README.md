BitShares 2 - Docker
====================

This repository serves as an archive for instructions to build docker images for
BitShares 2 and corresponding tools.

bitshares-2
-----------
This image serves as a dependency for the other images. It contains an Ubuntu
distribution and has the bitshares 2 application sources and executables
included.

bitshares-2-trusted-full-node
-----------------------------
Anybody interested in supporting the bitshares 2 network should run this image.
It opens a witness node and connects to the P2P network as full-node.

bitshares-2-delayed-node
------------------------
The delayed node is of particular interest for exchanges and 3rd party service
providers. If interfacing to his node's API, all information available will be
irreversible on the blockchain.

bitshares-2-cli-wallet
----------------------
The CLI wallet connects to a trusted full node and offers an API to interact
with the blockchain (transfers, orders, etc..)

bitshares-2-webwallet
---------------------
This image contains the web wallet and hosts it via nginx. In order to have a
SSL-secured connection, a new build with corresponding settings and certificats
is required.

bitshares-2-webwallet-full
--------------------------
This image contains a full Ubuntu distribution and required development tools to
build the web wallet.
