FROM alpine:3.21

# Essential build arguments
ARG DB_NAME \
    DB_USER \
    DB_PASS

# Install required PHP packages
RUN apk update && apk add --no-cache \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-json \
    php82-curl \
    php82-dom \
    php82-mbstring \
    php82-openssl \
    php82-xml \
    wget \
    unzip && \
    # Configure PHP-FPM
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php82/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php82/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php82/php-fpm.d/www.conf

# Set working directory
WORKDIR /var/www

# Install WordPress
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

# Copy and execute configuration script
COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN sh wp-config-create.sh && \
    rm wp-config-create.sh && \
    chmod 755 wp-content/

# Start PHP-FPM
CMD ["/usr/sbin/php-fpm82", "-F"]