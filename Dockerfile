FROM ubuntu:16.04
RUN apt-get update && apt-get install -y bc curl git jshon
RUN curl -fsSL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get update && apt-get install -y nodejs
RUN npm install -g feedbase
COPY bin/ /usr/local/bin/
COPY libexec/ /usr/local/libexec/
