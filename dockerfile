# Image PHP FPM
FROM php:8.2-fpm

# Installer dépendances système
RUN apt-get update && apt-get install -y \
    git curl zip unzip libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql bcmath

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Définir le dossier de travail
WORKDIR /var/www/html

# Copier tout le projet local (y compris storage complet)
COPY . .

# Créer storage/cache/logs/etc si manquant
RUN mkdir -p storage/app/public \
    storage/framework/cache \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs

# Forcer les permissions pour Laravel
RUN chown -R www-data:www-data storage bootstrap/cache

# Installer les dépendances Laravel
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Exposer le port
EXPOSE 80

# Lancer Laravel en mode dev (Render reconnaît php-fpm)
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
