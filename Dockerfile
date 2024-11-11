# Usa la imagen base de PHP 8.2 con FPM para compatibilidad con las dependencias
FROM php:8.2-fpm

# Instala dependencias necesarias para Laravel y otros paquetes PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

# Instala Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Establece el directorio de trabajo
WORKDIR /var/www

# Copia los archivos del proyecto al contenedor
COPY . .

# Instala las dependencias de PHP y Laravel con Composer
RUN composer install

# Otorga permisos para el almacenamiento de Laravel y el cache
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www/storage

# Exposición del puerto 9000 para PHP-FPM
EXPOSE 9000

# Inicia el servicio PHP-FPM
CMD ["php-fpm"]
