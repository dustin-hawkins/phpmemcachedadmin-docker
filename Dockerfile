FROM php:5.6-apache
MAINTAINER dhawkins@resultsgeneration.com


ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev git\
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached

# Install phpmemcacheadmin
RUN rm -rf /var/www/html/* && \
    git clone https://github.com/elijaa/phpmemcachedadmin.git /var/www/html/ && \
    mkdir /var/www/html/Config && \
    chown -R www-data:www-data /var/www/html
    
# Expose port
EXPOSE 80
