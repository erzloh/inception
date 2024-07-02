#!/bin/bash
# Script to initialize wordpress wp-config.php with WP-CLI

# Make sure that the database is up and running
sleep 3

# Check if the wp-config.php file does not exist
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	# Create the wp-config.php file
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'

	# Configure the user creation page
	wp core install		--allow-root \
						--url=$DOMAIN_NAME \
						--title=$SITE_TITLE \
						--admin_user=$ADMIN_USER \
						--admin_password=$ADMIN_PASSWORD \
						--admin_email=$ADMIN_EMAIL \
						--path='/var/www/wordpress'

	# Add a second user
	wp user create		--allow-root \
						$USER1_NAME \
						$USER1_EMAIL \
						--user_pass=$USER1_PASSWORD \
						--role='author' \
						--path='/var/www/wordpress'
fi

# # Create /run/php if it does not exist
if [ ! -d /run/php ]; then
	mkdir /run/php
fi

# # Start the php-fpm service
/usr/sbin/php-fpm7.3 -F