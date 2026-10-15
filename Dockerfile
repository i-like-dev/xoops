FROM php:8.1-apache

# 安裝 XOOPsS 與資料庫連接所需的 PHP 擴充功能
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 啟用 Apache Rewrite 模組（XOOPS 網址導向與模組會用到）
RUN a2enmod rewrite

# 將專案內的所有檔案複製到 Apache 的網頁根目錄
COPY . /var/www/html/

# 設定正確的檔案擁有者權ㄎ限
RUN chown -R www-data:www-data /var/www/html
