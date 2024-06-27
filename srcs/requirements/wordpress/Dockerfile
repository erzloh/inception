FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y wget

RUN apt install -y	php7.3 \
					php-fpm \
					php-mysql \
					mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.5.4-fr_FR.tar.gz -P /var/www

WORKDIR /var/www

RUN tar -xvf wordpress-6.5.4-fr_FR.tar.gz

RUN rm -rf wordpress-6.5.4-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/init_wordpress.sh /tmp/init_wordpress.sh

RUN chmod 755 /tmp/init_wordpress.sh

CMD [ "/tmp/init_wordpress.sh" ]