FROM nginx
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

## Core Utilities
RUN mkdir /www
ADD dist/* /www/
ADD nginx.conf /etc/nginx/nginx.conf

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start
