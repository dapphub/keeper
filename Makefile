# Set this variable if you want to use another Keeper account.
export KEEPER_ACCOUNT ?= default

# Set this variable in the Keeper account config file if you want to
# allow different Keeper accounts access to different Ethereum accounts.
export ETH_ALLOWED_ACCOUNTS ?= 

export KEEPERRC ?= $(HOME)/.keeperrc
export KEEPER_CONFIG ?= $(KEEPER_DATADIR)/config
export KEEPER_DATADIR ?= $(HOME)/.keeper/$(KEEPER_ACCOUNT)
export REDIS_DATADIR = $(KEEPER_DATADIR)/redis

# Set $ETH_RPC_HOST or $ETH_RPC_PORT to use an existing RPC endpoint.
# If these are unset, Keeper will automatically start a geth(1) node.
export GETH_NEEDED := $(if $(or $(ETH_RPC_HOST),$(ETH_RPC_PORT)),,yes)
export GETH := $(if $(GETH_NEEDED),geth,: geth [disabled])

export DEFAULT_ETH_RPC_HOST := $(if $(ETH_RPC_PORT),dockerhost,geth)
export ETH_RPC_HOST ?= $(DEFAULT_ETH_RPC_HOST)
export ETH_RPC_PORT ?= 8545

# For convenience, Keeper mounts the `~/.ethereum' directory from the
# host machine and exposes the RPC endpoint to `127.0.0.1:8545'.
export GETH_DATADIR ?= $(HOME)/.ethereum
export GETH_FLAGS ?=
export GETH_INTERFACE ?= 127.0.0.1
export GETH_PORT ?= 8545

ifeq ($(ETH_RPC_HOST),dockerhost)
# Needed to be able to bind `dockerhost' to the host machine:
export DOCKERHOST ?= $(shell ip ro | grep docker0 | awk '{print $$NF}')
ifeq ($(DOCKERHOST),)
$(error Could not determine IP address of Docker host)
endif
else
export DOCKERHOST ?=
endif

# Needed to be able to fix volume permissions in `./entrypoint':
export GROUP = $(shell id -gn)

# Default number of seconds between clock ticks:
export TICK ?= 60

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
