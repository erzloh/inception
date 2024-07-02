FROM debian:buster

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_MariaDB.sh /tmp/init_MariaDB.sh

RUN chmod 755 /tmp/init_MariaDB.sh

RUN service mysql start && sh /tmp/init_MariaDB.sh

EXPOSE 3306

CMD [ "mysqld" ]