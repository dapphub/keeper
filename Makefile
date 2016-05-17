# To use another Keeper account, use `make run KEEPER_ACCOUNT=foo'.
export KEEPER_ACCOUNT ?= default

# To allow different Keeper accounts access to different Ethereum accounts,
# set this variable in the account config (`~/.keeper/<account>/config').
export ETH_ALLOWED_ACCOUNTS ?= 

# Default number of seconds between clock ticks.
export TICK ?= 60

# To use an existing ETH RPC endpoint, use `make run ETH_RPC_PORT=<port>'.
# The ETH RPC host defaults to the host machine as accessed from Docker.
export DEFAULT_ETH_RPC_HOST := $(if $(ETH_RPC_PORT),dockerhost,geth)

# If no RPC host or port is set, Keeper will start its own geth(1) node.
export GETH_NEEDED := $(if $(or $(ETH_RPC_HOST),$(ETH_RPC_PORT)),,yes)
export GETH := $(if $(GETH_NEEDED),geth,: geth [disabled])

# These are used by the `eth-proxy' service (see `docker-compose.yml').
export ETH_RPC_HOST ?= $(DEFAULT_ETH_RPC_HOST)
export ETH_RPC_PORT ?= 8545

# For convenience, Keeper mounts the `~/.ethereum' directory from the
# host machine and exposes the RPC endpoint to `127.0.0.1:8545'.
export GETH_DATADIR ?= $(HOME)/.ethereum
export GETH_FLAGS ?=
export GETH_INTERFACE ?= 127.0.0.1
export GETH_PORT ?= 8545

# These should probably be kept to their defaults.
export KEEPERRC ?= $(HOME)/.keeperrc
export KEEPER_CONFIG ?= $(KEEPER_DATADIR)/config
export KEEPER_DATADIR ?= $(HOME)/.keeper/$(KEEPER_ACCOUNT)
export REDIS_DATADIR = $(KEEPER_DATADIR)/redis

# The `dockerhost' hostname may be set by Docker in the future.
# See <https://github.com/docker/docker/issues/1143>.
ifeq ($(ETH_RPC_HOST),dockerhost)
export DOCKERHOST ?= $(shell ip ro | grep docker0 | awk '{print $$NF}')
ifeq ($(DOCKERHOST),)
$(error Could not determine Docker host IP)
endif
else
export DOCKERHOST ?=
endif

# We need this to fix volume permissions in `./entrypoint'.
export GROUP = $(shell id -gn)

$(shell mkdir -p $(REDIS_DATADIR))
$(shell touch $(KEEPER_CONFIG))

$(info Keeper config: $(KEEPERRC))
$(info Keeper account: $(KEEPER_ACCOUNT))
$(info Keeper account config: $(KEEPER_CONFIG))
$(info Ethereum RPC host: $(ETH_RPC_HOST))
$(info Ethereum RPC port: $(ETH_RPC_PORT))
$(info Starting Ethereum node: $(if $(GETH_NEEDED),yes,no))
$(info )

all:; docker-compose build $(services)
run:; docker-compose up $(services)
