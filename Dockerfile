FROM php:8.1-apache

RUN apt-get update 

RUN apt-get install -y libtool libxml2-dev libcurl4-openssl-dev zlib1g-dev libpng-dev libxslt-dev libzip-dev zlib1g-dev libjpeg-dev libfreetype6-dev libjpeg62-turbo-dev git

RUN apt-get update \
    && apt-get install -y \
        librabbitmq-dev \
        libssh-dev \
    && pecl install amqp \
    && docker-php-ext-enable amqp

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install sockets
RUN docker-php-ext-install curl
RUN docker-php-ext-install intl
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install session
RUN docker-php-ext-install shmop
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install soap    
RUN docker-php-ext-install xml
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip

RUN docker-php-ext-enable bcmath
RUN docker-php-ext-enable sockets
RUN docker-php-ext-enable curl
RUN docker-php-ext-enable intl
RUN docker-php-ext-enable mysqli
RUN docker-php-ext-enable opcache
RUN docker-php-ext-enable pcntl
RUN docker-php-ext-enable pdo
RUN docker-php-ext-enable pdo_mysql
RUN docker-php-ext-enable session
RUN docker-php-ext-enable shmop
RUN docker-php-ext-enable simplexml
RUN docker-php-ext-enable soap    
RUN docker-php-ext-enable xml
RUN docker-php-ext-enable xsl
RUN docker-php-ext-enable zip


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get install -y nodejs

RUN a2enmod rewrite