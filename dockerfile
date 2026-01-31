# -------------------------------
# Étape 1 : Image PHP FPM
# -------------------------------
FROM php:8.2-fpm

# Installer dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    git curl zip unzip libpq-dev libzip-dev zlib1g-dev libonig-dev \
    && docker-php-ext-install pdo pdo_pgsql mbstring bcmath zip

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Définir le dossier de travail
WORKDIR /var/www/html

# -------------------------------
# Étape 2 : Copier tout le projet
# -------------------------------
# On copie tout, y compris storage complet, sans dépendre de GitHub
COPY . .

# -------------------------------
# Étape 3 : Créer les sous-dossiers Laravel
# -------------------------------
RUN mkdir -p storage/app/public \
    storage/framework/cache \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    bootstrap/cache

# -------------------------------
# Étape 4 : Forcer les permissions
# -------------------------------
RUN chown -R www-data:www-data storage bootstrap/cache

# -------------------------------
# Étape 5 : Installer les dépendances Laravel
# -------------------------------
RUN composer install --no-dev --optimize-autoloader --no-interaction

# -------------------------------
# Étape 6 : Optimiser Laravel
# -------------------------------
RUN php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache

# -------------------------------
# Étape 7 : Exposer le port
# -------------------------------
EXPOSE 80

# -------------------------------
# Étape 8 : Commande par défaut
# -------------------------------
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
