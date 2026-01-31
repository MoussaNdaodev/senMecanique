# Dockerfile pour Laravel sur Render

FROM php:8.2-cli

# Arguments optionnels
ARG COMPOSER_ALLOW_SUPERUSER=1

# Installer les dépendances système et PHP nécessaires
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
    libexif-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j$(nproc) \
    pdo \
    pdo_mysql \
    mbstring \
    bcmath \
    gd \
    intl \
    zip \
    xml \
    exif \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Installer Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Définir le dossier du projet
WORKDIR /var/www/html

# Copier le projet
COPY . .

# Permissions pour Laravel
RUN mkdir -p storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# Installer les dépendances PHP avec Composer
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Exposer le port HTTP pour Render
EXPOSE 10000

# Lancer le serveur intégré de Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=10000"]
