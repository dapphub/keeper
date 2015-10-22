FROM bitshares/bitshares-2
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

RUN apt-get install -y screen

## Copying default configuration
ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Exposing Ports
EXPOSE 8092

## Entry point
ENTRYPOINT ["/start.sh"]
