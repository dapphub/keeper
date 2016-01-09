FROM bitshares/bitshares-2
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

VOLUME ["/conf/witness/"]

## Copying default configuration
RUN mkdir /data_witness_node
ADD docker/default.conf /data_witness_node/default.ini
ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Exposing Ports
EXPOSE 9090
EXPOSE 8090

## Entry point
ENTRYPOINT ["/start.sh"]
