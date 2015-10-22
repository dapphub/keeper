FROM bitshares-2
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

## Copying default configuration
RUN mkdir /data_delayed_node
ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Exposing Ports
EXPOSE 8091

## Entry point
ENTRYPOINT ["/start.sh"]
