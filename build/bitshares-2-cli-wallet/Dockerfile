FROM bitshares/bitshares-2
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

VOLUME ["/conf/cli-wallet/"]

## Copying default configuration
ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Exposing Ports
EXPOSE 8092

## Entry point
ENTRYPOINT ["/start.sh"]
