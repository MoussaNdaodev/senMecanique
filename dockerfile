# Dockerfile

FROM php:8.2-fpm

# Arguments optionnels
ARG COMPOSER_ALLOW_SUPERUSER=1

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    curl \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libicu-dev \
    libpq-dev \
    pkg-config \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        mbstring \
        bcmath \
        gd \
        intl \
        zip \
        xml \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Installer Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Créer le dossier du projet
WORKDIR /var/www/html

# Copier le projet
COPY . .

# Permissions pour Laravel
RUN mkdir -p storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# Installer les dépendances PHP
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Exposer le port PHP-FPM
EXPOSE 9000

# Lancer PHP-FPM
CMD ["php-fpm"]
