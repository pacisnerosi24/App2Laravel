# Usar una imagen base de PHP
FROM php:8.1-fpm

# Instalar dependencias necesarias (extensiones de PHP)
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libzip-dev unzip git && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd zip pdo pdo_mysql

# Instalar Composer (gestor de dependencias de PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /var/www

# Copiar el contenido del proyecto en el contenedor
COPY . .

# Instalar dependencias de Laravel
RUN composer install

# Dar permisos al almacenamiento y caché de Laravel
RUN chmod -R 777 /var/www/storage /var/www/bootstrap/cache

# Exponer el puerto 9000
EXPOSE 9000

# Iniciar el servidor FPM de PHP
CMD ["php-fpm"]
