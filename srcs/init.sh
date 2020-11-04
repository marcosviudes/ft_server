echo "installing phpmyadmin"
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip
unzip phpMyAdmin-5.0.2-all-languages.zip
mv phpMyAdmin-5.0.2-all-languages /var/www/phpmyadmin

echo "=============Copying files=============="
mkdir /var/www/wordpress
tar -xf /temp/latest-es_ES.tar.gz -C /var/www/
chmod -R 777 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

echo "=============Configuration=============="
rm /etc/nginx/sites-enabled/default
mv /temp/nginx-config.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx-config.conf /etc/nginx/sites-enabled/default

service nginx start
service mysql start
service php7.3-fpm start
echo "=============Scritp ended=============="