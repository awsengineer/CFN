#!/bin/bash
yum update -y
yum install httpd python34 python34-pip -y
/usr/bin/pip-3.4 install sphinx
/usr/bin/pip-3.4 install htmltag
/usr/bin/pip-3.4 install boto3
chkconfig httpd on
service httpd start
wget https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/demo -O /var/www/cgi-bin/demo
wget https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/insert.py -O /var/www/cgi-bin/insert.py
chmod +x /var/www/cgi-bin/demo
chmod +x /var/www/cgi-bin/insert.py
