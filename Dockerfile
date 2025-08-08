FROM php:8.1-apache

# Installeer extra PHP-extensies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-install zip mysqli pdo pdo_mysql

# Activeer .htaccess ondersteuning
RUN a2enmod rewrite

# Stel werkmap in
WORKDIR /var/www/html

# Kopieer alle bestanden naar container
COPY . /var/www/html/

# Zorg voor correcte rechten
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80