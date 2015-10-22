FROM bitshares-2
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

## Copying default configuration
RUN mkdir /data_trusted_node
ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Exposing Ports
EXPOSE 9090
EXPOSE 8090

## Entry point
ENTRYPOINT ["/start.sh"]
