#!/bin/bash


while true; do
        php /var/www/satis/bin/satis build /var/www/satis/satis.json /var/www/satis/web/ -vvv
	echo "done"
        sleep 180
done

