#!/bin/bash
yum install -y httpd php git

cd /var/www/html



wget https://github.com/shivin-gh/lb-test.git/img2.jpg
mv img2.jpg img.jpg
wget https://github.com/shivin-gh/lb-test.git/index.php
mv /var/www/html/htaccess /var/www/html/.htaccess

mkdir /var/www/html/img
cp /var/www/html/img.jpg /var/www/html/img
cp /var/www/html/index.php /var/www/html/img
cp /var/www/html/.htaccess /var/www/html/img

sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;