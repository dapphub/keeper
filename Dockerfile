FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl jshon redis-tools
RUN curl -fsSL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get update && apt-get install -y nodejs
COPY bin/ /usr/local/bin/
COPY node_modules/ /usr/local/node_modules/
