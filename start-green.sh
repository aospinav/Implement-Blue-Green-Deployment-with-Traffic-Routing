#!/bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
echo "Green Environment" > /var/www/html/index.html
echo "Hostname: $(hostname)" >> /var/www/html/index.html