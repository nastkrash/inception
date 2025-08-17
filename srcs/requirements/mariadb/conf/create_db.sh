# Init database if not done yet
if [ ! -d "/var/lib/mysql/mysql" ]; then
        chown -R mysql:mysql /var/lib/mysql
        mysql_install_db --user=mysql
fi

if [ ! -d "/var/lib/mysql/wordpress" ]; then
        mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
fi