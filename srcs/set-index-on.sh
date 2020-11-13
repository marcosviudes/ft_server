rm /etc/nginx/sites-enabled/default_indexoff
mv /var/www/html/index.html /temp
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
service nginx restart
