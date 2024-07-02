FROM debian:buster

ENV SQL_DATABASE=mydatabase
ENV SQL_USER=eric
ENV SQL_PASSWORD=sqlpassword
ENV SQL_ROOT_PASSWORD=sqlrootpassword

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_MariaDB.sh /tmp/init_MariaDB.sh

RUN chmod 755 /tmp/init_MariaDB.sh

RUN service mysql start && sh /tmp/init_MariaDB.sh

EXPOSE 3306

CMD [ "mysqld" ]

# COPY conf/50-server_test.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY tools/init_MariaDB_test.sh /tmp/init_MariaDB.sh

# ENTRYPOINT ["bash", "/tmp/init_MariaDB.sh"]

# EXPOSE 3306