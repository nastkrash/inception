# Init database if not done yet
if [ ! -d "/var/lib/mysql/mysql" ]; then
        chown -R mysql:mysql /var/lib/mysql
        mysql_install_db --user=mysql
fi

# Create WordPress database and user if not exists
if [ ! -d "/var/lib/mysql/wordpress" ]; then
        /usr/bin/mysqld --user=mysql --bootstrap << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
fi