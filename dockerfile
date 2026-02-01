# Dockerfile Laravel + PostgreSQL + Mix pour Render
FROM php:8.2-cli

ARG COMPOSER_ALLOW_SUPERUSER=1

# Installer Node.js 20 (au lieu de 18 pour éviter les erreurs de moteur)
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

# Dossier de travail
WORKDIR /var/www/html

# Copier les fichiers de dépendances d'abord
COPY package*.json ./
COPY composer.json composer.lock* ./

# Installer dépendances PHP Laravel
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Installer dépendances NPM (sans --production pour avoir devDependencies)
RUN npm install --legacy-peer-deps

# Copier le reste du projet
COPY . .

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

# Exposer le port HTTP pour Render
EXPOSE 10000

# Lancer Laravel avec le port dynamique Render
CMD ["sh", "-c", "php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=${PORT:-10000}"]
