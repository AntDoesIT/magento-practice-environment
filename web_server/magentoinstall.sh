#!/bin/sh

composer create-project --repository-url=https://repo.magento.com/magento/project-community-edition=2.4
php /var/www/html/bin/magento setup:install --base-url=http://localhost/ --db-host=mysql --db-name=magento --db-user=root --db-password=newpass --admin-firstname=Admin --admin-lastname=Admin --admin-email=antdoesit@gmail.com --admin-user=admin --admin-password=test123 --language=en_US --backend-frontname=admin --search-engine=elasticsearch7 --elasticsearch-host=elasticsearch --elasticsearch-port=9200
php /var/www/html/bin/magento deploy:mode:set developer
php /var/www/html/bin/magento sampledata:deploy
php /var/www/html/bin/magento setup:upgrade
php /var/www/html/bin/magento cache:clean
exit 0
