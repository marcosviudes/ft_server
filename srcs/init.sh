echo "=============Copying files=============="
mkdir /var/www/wordpress
tar -xf /temp/latest-es_ES.tar.gz -C /var/www/
#rm -rf /temp

echo "=============Configuration=============="
chmod -R 777 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

service nginx start
service mysql start
service php7.3-fpm start
echo "=============Scritp ended=============="