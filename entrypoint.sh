#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${TZ:=Etc/UTC}"
: "${LISTEN_ADDR:=80}"
: "${PHP_MEMORY_LIMIT:=256M}"
: "${DB_HOST:=127.0.0.1}"
: "${DB_PORT:=3306}"
: "${DB_USER:=username}"
: "${DB_PASS:=password}"
: "${DB_NAME:=observium}"

# Timezone
echo "$TZ" > /etc/timezone
ln -nsf "/usr/share/zoneinfo/$TZ" /etc/localtime
dpkg-reconfigure tzdata

# PHP timezone
echo "date.timezone = \"$TZ\"" > /etc/php/7.0/mods-available/local.ini
ln -nsf /etc/php/7.0/mods-available/local.ini /etc/php/7.0/cli/conf.d/20-local.ini
ln -nsf /etc/php/7.0/mods-available/local.ini /etc/php/7.0/fpm/conf.d/20-local.ini

# PHP logs
sed -i -e "s/^error_log = \/var\/log\/php7\.0-fpm\.log$/error_log = $(echo "$OBSERVIUM_HOME" | sed -e 's/\//\\\//g')\/logs\/php7.0-fpm.log/" /etc/php/7.0/fpm/php-fpm.conf

# PHP memory limit
sed -i -e "s/^memory_limit = 128M$/memory_limit = $PHP_MEMORY_LIMIT/" /etc/php/7.0/fpm/php.ini

# Nginx listen address:port
sed -i -e "s/LISTEN_ADDR/$LISTEN_ADDR/" /etc/nginx/sites-available/default

# Observium volume ownership
chown -R www-data:www-data "$OBSERVIUM_HOME/logs" "$OBSERVIUM_HOME/rrd"

# Observium configuration
cat > "$OBSERVIUM_HOME/config.php" <<EOF
<?php
\$config['db_extension'] = 'mysqli';
\$config['db_host']      = '$DB_HOST';
\$config['db_port']      = '$DB_PORT';
\$config['db_user']      = '$DB_USER';
\$config['db_pass']      = '$DB_PASS';
\$config['db_name']      = '$DB_NAME';
\$config['base_url']     = '$BASE_URL';
EOF

# Observium database upgrade
gosu www-data "$OBSERVIUM_HOME/discovery.php" -u

# Start services
/etc/init.d/cron start
/etc/init.d/php7.0-fpm start
/etc/init.d/nginx start

# Wait indefinitely
exec sleep infinity
