FROM debian:buster
LABEL Marcos Viudes
#WORKDIR /temp
RUN apt-get -y update --no-install-recommends \
    && apt-get -y upgrade \
    && apt-get -y install wget\
    && apt-get -y install apt-utils\
    && apt-get -y install nginx\
    && apt-get -y install mariadb-server\
    && apt-get -y install php-fpm php-mysql\
    php-gd php-xml php-pear php-gettext php-cgi\
    && rm -rf /var/lib/apt/lists/*
COPY srcs/ ./temp
EXPOSE 80 443
CMD /bin/bash
