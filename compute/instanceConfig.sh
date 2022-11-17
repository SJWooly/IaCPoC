#!/bin/bash
sudo su
yum update -y
yum install httpd -y
service httpd start
cd /var/www/html
echo "<html><body><h1>Hello World! </h1></body></html>" > index.html


#@TODO refine with further automation ie systemctl?