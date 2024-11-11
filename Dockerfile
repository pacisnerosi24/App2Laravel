# Usa la imagen oficial de PHP con soporte para PHP-FPM
FROM php:8.2-fpm

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl

# Instala extensiones de PHP necesarias para Laravel
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Instala Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configura el directorio de trabajo
WORKDIR /var/www

# Copia el archivo de dependencias y las instala
COPY composer.json composer.lock ./
RUN composer install --no-scripts --no-autoloader

# Copia la aplicación Laravel al contenedor
COPY . .

# Ejecuta autoload de Composer
RUN composer dump-autoload

# Da permisos a la carpeta de almacenamiento
RUN chown -R www-data:www-data /var/www/storage

RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache


# Expone el puerto 8080
EXPOSE 8080

# Comando de inicio que usa php artisan serve en el puerto 8080
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
