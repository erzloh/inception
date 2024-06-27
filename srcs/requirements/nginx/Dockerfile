FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install -y nginx

# RUN apt install -y vim

# RUN apt install -y curl

RUN apt install -y openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]