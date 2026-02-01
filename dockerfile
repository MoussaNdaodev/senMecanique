# Dockerfile Laravel – Render (OK vues + sessions)

FROM php:8.2-cli

ARG COMPOSER_ALLOW_SUPERUSER=1

# Dépendances système + PHP
RUN apt-get update && apt-get install -y \
    git unzip zip curl \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libxml2-dev libicu-dev libpq-dev \
    pkg-config libexif-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install \
    pdo pdo_mysql mbstring bcmath gd intl zip xml exif \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copier le projet
COPY . .

# 🔥 CRUCIAL : créer TOUS les dossiers Laravel nécessaires
RUN mkdir -p \
    storage/framework/sessions \
    storage/framework/views \
    storage/framework/cache \
    storage/logs \
    bootstrap/cache \
 && chmod -R 775 storage bootstrap/cache

# Installer dépendances PHP
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Nettoyer les caches Laravel
RUN php artisan config:clear \
 && php artisan cache:clear \
 && php artisan route:clear \
 && php artisan view:clear

# Render détecte le port automatiquement
EXPOSE 10000

# ⚠️ Utiliser le PORT fourni par Render
CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=${PORT}"]
