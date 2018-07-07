echo -n "Stack name to create: "
read stackname
bucketname="mehdi100"
keypair="my_singapore_keypair"
region="ap-southeast-1"

rm -f *template
wget -q https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/Master.template -O Master.template

wget -q https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/DynamoDB_Table.template -O DynamoDB_Table.template

wget -q https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/Base.template -O Base.template

wget -q https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/insert.py -O insert.py

wget -q https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/demo -O demo

wget -q https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/AddNATGateway.template -O AddNATGateway.template

wget -q https://raw.githubusercontent.com/awsengineer/CFN/master/Nested/v1.5_UsingDynamoDB/WEBandELB.template -O WEBandELB.template

aws s3 cp DynamoDB_Table.template  s3://$bucketname/mehdicfns/DynamoDB_Table.template
aws s3 cp Master.template  s3://$bucketname/mehdicfns/Master.template
aws s3 cp Base.template  s3://$bucketname/mehdicfns/Base.template
aws s3 cp AddNATGateway.template  s3://$bucketname/mehdicfns/AddNATGateway.template
aws s3 cp WEBandELB.template s3://$bucketname/mehdicfns/WEBandELB.template

aws cloudformation create-stack --capabilities CAPABILITY_IAM --disable-rollback \\
    --region $region --stack-name $stackname \\
    --template-url https://s3.amazonaws.com/mehdi100/mehdicfns/Master.template \\
    --parameters ParameterKey=KeyPairName,ParameterValue=my_singapore_keypair
