FROM debian:buster

ENV SQL_ROOT_PASSWORD=sqlrootpassword
ENV SQL_DATABASE=sqldatabase
ENV SQL_USER=sqluser
ENV SQL_PASSWORD=sqlpassword

RUN apt update -y && apt upgrade -y

RUN apt install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_MariaDB.sh /tmp/init_MariaDB.sh

RUN chmod 755 /tmp/init_MariaDB.sh

# run script
RUN service mysql start && sh /tmp/init_MariaDB.sh

EXPOSE 3306

CMD [ "mysqld" ]


# enter the container to debug
# CMD [ "bash" ]
