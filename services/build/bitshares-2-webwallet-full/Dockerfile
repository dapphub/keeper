FROM ubuntu:15.04
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

## Core Utilities
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y nodejs-legacy npm git nginx
RUN npm install -g coffee-script

RUN git clone http://github.com/bitshares/bitshares-2-ui /build
WORKDIR /build
RUN for I in cli dl web; do cd $I; npm install; cd ..; done 

WORKDIR /build/web
RUN npm run build

RUN mkdir /www
RUN cp -rv /build/web/dist/* /www/

ADD nginx.conf /etc/nginx/nginx.conf

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start
