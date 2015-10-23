BitShares 2 - Docker
====================

This repository serves as an archive for instructions to build docker images for
BitShares 2 and corresponding tools.

Step-By-Step
============

Running a Full Node
-------------------

    ./run-trusted-full-node.sh

This exposes port `9090` globally to get access to the P2P network.
If you want to expose the RPC port to you need to run:

    ./run-trusted-full-node-rpc.sh


Running a Delayed Node
----------------------

    ./run-trusted-full-node.sh  ## Dependency for the delayed container
    ./run-delayed-node.sh

The delayed node will automatically interface with the trusted node on a private
network. The delayed node will expose port `8091` for RPC queries and bind to
`localhost` only.

Running a CLI wallet
----------------------

    ./run-trusted-full-node.sh  ## Dependency for the delayed container
    ./run-cli-wallet.sh

The CLI wallet will automatically interface with the trusted node on a private
network. The cli wallet will expose port `8092` for RPC queries and will bind to
`localhost` only.

Running the web wallet
----------------------

    ./run-web-wallet.sh

This container basically only contains a nginx server that can be configured
from outside the container. The delivered data has to be stored in
`web-wallet-data/www/` while the nginx configuration is located in
`web-wallet-data/conf/`. Providing the web wallet itself is task of the
container user. SSL configuration is left to the user as well.

All Containers
==============

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

Build Instructions
==================

The Dockerfiles that build the container are provided in the `build` sub
directory. The corresponding `build-docker.sh` script will build the containers.
