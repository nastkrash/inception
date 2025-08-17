FROM alpine:3.21

ARG DB_NAME \
    DB_PASS \
    DB_USER \
    DB_ROOT

RUN apk update && apk add mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chown -R mysql:mysql /var/run/mysqld; \
    chmod 755 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } > /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf


COPY requirements/mariadb/conf/create_db.sh .
RUN sh create_db.sh && rm create_db.sh
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]