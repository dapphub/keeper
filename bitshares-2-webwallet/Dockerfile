FROM nginx
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

## Core Utilities
ADD nginx.conf /etc/nginx/nginx.conf
RUN mkdir /www /data
ADD dist_2.15.287.tar.gz /data

WORKDIR /data

RUN cp -Rv /data/dist/* /www/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start
