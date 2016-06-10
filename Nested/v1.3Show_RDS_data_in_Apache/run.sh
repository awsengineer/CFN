aws s3 cp AddNATGateway.template  s3://fujitsu-cloud/mehdicfns/AddNATGateway.template
aws s3 cp Base.template  s3://fujitsu-cloud/mehdicfns/Base.template
aws s3 cp MasternoRDS.template  s3://fujitsu-cloud/mehdicfns/MasternoRDS.template
aws s3 cp Master.template  s3://fujitsu-cloud/mehdicfns/Master.template
aws s3 cp RDSfromsnapshot.template  s3://fujitsu-cloud/mehdicfns/RDSfromsnapshot.template
aws s3 cp RDS.template  s3://fujitsu-cloud/mehdicfns/RDS.template
aws s3 cp WEBandELB.template s3://fujitsu-cloud/mehdicfns/WEBandELB.template

aws cloudformation create-stack --region us-east-1 --stack-name monstack1 --template-url https://s3-ap-southeast-2.amazonaws.com/fujitsu-cloud/mehdicfns/Master.template  --parameters ParameterKey=KeyPairName,ParameterValue=fujitsu-cloud-virginia

#aws cloudformation create-stack \
#	--region us-east-1 \
#	--stack-name webstack \
#	--template-url https://s3-ap-southeast-2.amazonaws.com/fujitsu-cloud/mehdicfns/WEBandELB.template \
#	--parameters 	ParameterKey=HTTPImageID,ParameterValue=ami-08111162 \
#			ParameterKey=HTTPInstanceType,ParameterValue=t2.micro \
#			ParameterKey=KeyPairName,ParameterValue=fujitsu-cloud-virginia \
#			ParameterKey=LinuxBastionSecurityGroup,ParameterValue=sg-64c8591f \
#			ParameterKey=PublicSubnetA,ParameterValue=subnet-cce6abe6 \
#			ParameterKey=PublicSubnetB,ParameterValue=subnet-f73c0081 \
#			ParameterKey=PrivateSubnetA,ParameterValue=subnet-cfe6abe5 \
#			ParameterKey=PrivateSubnetB,ParameterValue=subnet-f63c0080 \
#			ParameterKey=RDSSecurityGroup,ParameterValue=sg-6ccb5a17 \
#			ParameterKey=VPCID,ParameterValue=vpc-02d77065
