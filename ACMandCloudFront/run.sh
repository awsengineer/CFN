echo "Stack name please:"
read stackName

acmcert=$(aws acm list-certificates --query "CertificateSummaryList[?DomainName==\`cdn.redhatarchitect.com\`]" --output text | awk '{print $1}')
echo $acmcert | grep "us-east-1" > /dev/null
if [ $? -eq 0 ]
then
	echo "Skipping the certificate creation. It already exists."
else
	aws acm request-certificate --region us-east-1 --domain-name cdn.redhatarchitect.com
fi

aws s3 cp /Users/mssalehi/CFN/ACMandCloudFront/cloudfront.template s3://mehdi100
aws cloudformation create-stack --region us-east-1 --stack-name $stackName --template-url https://s3.amazonaws.com/mehdi100/cloudfront.template 

#--parameters ParameterKey=acmcert,ParameterValue=$acmcert
