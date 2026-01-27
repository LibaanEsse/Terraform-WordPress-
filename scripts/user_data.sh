#!/bin/bash
apt update -y
apt upgrade -y
apt install -y apache2 php php-mysql wget unzip curl
systemctl start apache2
systemctl enable apache2

cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress/* .
rm -rf wordpress latest.zip

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
systemctl restart apache2

