FROM 131826866465.dkr.ecr.eu-west-1.amazonaws.com/docker-images:php8.2-fpm-alpine

# Copy sources
COPY . /var/www/

# Install composer dependencies
RUN cd /var/www/ \
 && composer install --no-dev --optimize-autoloader --no-progress --no-suggest --no-interaction \
 && php /var/www/bin/satis build /var/www/satis.json /var/www/public/ -vvv

# Cron
COPY .docker/fpm/var/spool/cron/crontabs/www-data /var/spool/cron/crontabs/www-data

VOLUME /var/www/public/