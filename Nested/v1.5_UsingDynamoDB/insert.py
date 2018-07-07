#!/usr/bin/python34

from htmltag import img, center
import cgi, cgitb

# Create an instance of FieldStorage
form = cgi.FieldStorage()

# Get data from fields
fname = form.getvalue('fname')
lname  = form.getvalue('lname')
address  = form.getvalue('address')

import boto3

dynamodb = boto3.resource('dynamodb',region_name='ap-southeast-1')
table = dynamodb.Table('table1')

response = table.put_item(
   Item={
        'fname': fname,
        'lname': lname,
        'address': address
    }
)


print ("""
<!DOCTYPE html>
<html>
<body>
<meta HTTP-EQUIV="REFRESH" content="0; url=/cgi-bin/demo">
</body>
</html>
""")
