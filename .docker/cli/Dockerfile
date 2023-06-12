ARG AWS_ACCOUNT_ID
ARG AWS_REGION
ARG ECR_REPOSITORY=docker-images
ARG IMAGE_TAG

FROM ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY}:${IMAGE_TAG}

# Copy sources
COPY . /var/www/satis/
COPY .docker/cli/satisUpdater.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/satisUpdater.sh
# Install composer dependencies
RUN cd /var/www/satis/ \
 && composer install --no-dev --optimize-autoloader --no-progress --no-suggest --no-interaction \
 && php /var/www/satis/bin/satis build /var/www/satis/satis.json /var/www/satis/web/ -vvv

RUN sed -i 's!/var/www/!/var/www/satis/web!g' /etc/apache2/conf.d/recommerce.conf


COPY .docker/cli/supervisor/supervisord.ini /etc/supervisor.d/

CMD "/usr/bin/supervisord"
