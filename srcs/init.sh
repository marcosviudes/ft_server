echo "installing phpmyadmin"
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip
unzip phpMyAdmin-5.0.2-all-languages.zip
mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
mv temp/config.sample.inc.php /var/www/html/phpmyadmin
chmod -R 777 /var/www/html/phpmyadmin
chown -R www-data:www-data /var/www/html/phpmyadmin
echo "\033[1;32mphpmyadmin [OK]\033[0m"

echo "Configurating Wordpress"
mkdir /var/www/html/wordpress
tar -xf /temp/latest-es_ES.tar.gz -C /var/www/html/
mv /temp/wp-config /var/www/html/wordpress
chmod -R 777 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress
echo "\033[1;32mWordpress [OK]\033[0m"

echo "Configurating Nginx"
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
mv /temp/default /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
nginx -t

echo "Starting Services"
service nginx start
service mysql start
service php7.3-fpm start
echo "\033[1;32mServices started\033[0m"

echo "Creating Database"
echo "CREATE DATABASE MyDatabase" | mysql -u root
echo "GRANT ALL PRIVILEGES ON MyDatabase.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user='root';" | mysql -u root
echo "\033[1;32mDatabase Created\033[0m"
#mysql -u root
#quit
# mysql wordpress -u root --password= < /tmp/wordpress.sql
#mysql -u root < /var/www/html/html/phpmyadmin/sql/create_tables.sql


echo "=============Scritp ended=============="