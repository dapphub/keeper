export GROUP = $(shell id -gn)
export REDIS_PORT = 56379
export GETH_FLAGS = 

all:; docker-compose build $(services)
run:; docker-compose up $(services)
