# Dockerfile Laravel + PostgreSQL pour Render

FROM php:8.2-cli

ARG COMPOSER_ALLOW_SUPERUSER=1

# Installer dépendances système + PostgreSQL
RUN apt-get update && apt-get install -y \
    git unzip zip curl \
    libzip-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libicu-dev \
    libpq-dev \
    pkg-config \
    libexif-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install \
    pdo \
    pdo_pgsql \
    mbstring \
    bcmath \
    gd \
    intl \
    zip \
    xml \
    exif \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Installer Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Dossier de travail
WORKDIR /var/www/html

# Copier le projet
COPY . .

# 🔥 Créer TOUS les dossiers requis par Laravel
RUN mkdir -p \
    storage/framework/sessions \
    storage/framework/views \
    storage/framework/cache \
    storage/logs \
    bootstrap/cache \
 && chmod -R 775 storage bootstrap/cache

# Installer dépendances PHP Laravel
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Nettoyer caches Laravel
RUN php artisan config:clear \
 && php artisan cache:clear \
 && php artisan route:clear \
 && php artisan view:clear

# Render fournit le port
EXPOSE 10000

# Lancer Laravel avec le port dynamique Render
CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=${PORT}"]
