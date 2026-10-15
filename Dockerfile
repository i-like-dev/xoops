FROM php:8.1-apache

# 安裝資料庫及 Zip 擴充功能所需的相依套件
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install mysqli pdo pdo_mysql zip

# 啟用 Apache Rewrite 模組
RUN a2enmod rewrite

# 放大 PHP 記憶體限制
RUN echo "memory_limit = 512M" > /usr/local/etc/php/conf.d/memory.ini

# 將專案檔案複製到網頁根目錄
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html
