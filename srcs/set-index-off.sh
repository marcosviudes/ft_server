rm /etc/nginx/sites-enabled/default
mv /temp/index.html /var/www/html/
ln -s /etc/nginx/sites-available/default_indexoff /etc/nginx/sites-enabled/
service nginx restart