#!/bin/sh

composer create-project magento/community-edition .
php magento setup:install \
  --admin-firstname=Admin \
  --admin-lastname=Admin \
  --admin-email=mike.rhoden@hanes.com \
  --admin-user=admin \
  --admin-password=password1 \
  --base-url=http://magentodevbox.centralus.cloudapp.azure.com/ \
  --db-host=mysql \
  --db-name=magento \
  --db-user=root \
  --db-password=newpass \
  --currency=USD \
  --timezone=America/Chicago \
  --language=en_US \
  --use-rewrites=1 \
  --search-engine=elasticsearch7 \
  --elasticsearch-host=elasticsearch \
  --elasticsearch-port=9200
php /var/www/html/bin/magento deploy:mode:set developer
php /var/www/html/bin/magento sampledata:deploy
php /var/www/html/bin/magento setup:upgrade
php /var/www/html/bin/magento cache:clean
exit 0
