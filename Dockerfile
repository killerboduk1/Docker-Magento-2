FROM php:8.1-apache

RUN apt-get update 

RUN apt-get install -y libtool
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y libzip-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y git

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

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt install -y nodejs
RUN apt install -y npm
RUN apt install -y grunt

RUN a2enmod rewrite
