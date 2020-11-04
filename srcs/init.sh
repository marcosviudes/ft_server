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

#creating database
echo "CREATE DATABASE MyDatabase" | mysql -u root
echo "GRANT ALL PRIVILEGES ON MyDatabase.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user='root';" | mysql -u root
mysql -u root
# mysql wordpress -u root --password= < /tmp/wordpress.sql
mysql -u root < /var/www/html/phpmyadmin/sql/create_tables.sql


quit
echo "=============Scritp ended=============="