#!/bin/sh
ins_id=$(ec2metadata --instance-id)
sudo dpkg --configure -a
sudo apt-get update -y
sudo apt-get install python-pip -y
sudo apt-get install jq -y
sudo apt-get update -y
pip install awscli==1.14.68
aws opsworks register --infrastructure-class ec2 --region us-east-1 --stack-id ${stack_id} --local
sleep 120

aws opsworks assign-instance --region us-east-1 --instance-id `aws opsworks --region us-east-1 describe-instances --stack-id ${stack_id} | jq -r '.Instances[] | select(.Ec2InstanceId=="'"$ins_id"'")|.InstanceId'` --layer-ids ${layer_id}
