#!/bin/bash
yum update -y
yum install httpd python34 python34-pip -y
/usr/bin/pip-3.4 install sphinx
/usr/bin/pip-3.4 install htmltag
/usr/bin/pip-3.4 install PyMySQL
chkconfig httpd on
service httpd start
wget https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.4Show_RDS_data_in_Apache/ted.py -O /var/www/cgi-bin/ted
wget https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.4Show_RDS_data_in_Apache/insert.py -O /var/www/cgi-bin/insert.py
chmod +x /var/www/cgi-bin/ted
chmod +x /var/www/cgi-bin/insert.py
