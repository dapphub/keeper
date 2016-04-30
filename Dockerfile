FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl jshon
RUN apt-get update && apt-get install -y redis-tools
COPY bin/ /bin/
