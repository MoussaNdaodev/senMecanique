# Dockerfile Laravel + PostgreSQL + Mix pour Render
FROM php:8.2-cli

ARG COMPOSER_ALLOW_SUPERUSER=1

# Installer dépendances système et Node.js 20
RUN apt-get update && apt-get install -y \
    git unzip zip curl \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libxml2-dev libicu-dev \
    libpq-dev pkg-config libexif-dev \
    gnupg ca-certificates \
 && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs \
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
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Installer Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier tout le projet
COPY . .

# Installer dépendances PHP Laravel
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Installer dépendances NPM
RUN npm install --legacy-peer-deps

# Créer tous les dossiers Laravel requis
RUN mkdir -p \
    storage/framework/sessions \
    storage/framework/views \
    storage/framework/cache \
    storage/logs \
    bootstrap/cache \
 && chmod -R 775 storage bootstrap/cache

# Builder les assets avec Laravel Mix
RUN npm run prod

# Nettoyer caches Laravel
RUN php artisan config:clear \
 && php artisan cache:clear \
 && php artisan route:clear \
 && php artisan view:clear

# 🔹 Créer le storage link pour les images
RUN php artisan storage:link

# Exposer le port HTTP pour Render
EXPOSE 10000

# Lancer Laravel avec migration, seed et serveur
CMD ["sh", "-c", "php artisan migrate --force && php artisan db:seed --force && php artisan serve --host=0.0.0.0 --port=${PORT:-10000}"]
