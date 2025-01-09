#!/bin/bash


# This script will list all the resources in the AWS account
# Author: mohana/ Observability Engineer
# version: v0.0.1
# Follwing are the supported services
# 1. EC2
# 2. S3
# 3. RDS
# 4. Dynamo DB
# 5. Lambda
# 6. CloudFront
# 7. EBS
# 8. SNS
# 9. SQS
# 10. CloudWatch
# Usage: ./aws_resource_list.sh <region> <service>



if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi
# check if the aws cli is installed 
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it and try again."
    exit 1
fi

# Check if aws cli is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured"
    exit 1
fi

# Execute the aws cli command based on the service

case $2 in
    EC2)
    aws ec2 describe-instances --region $1
    ;;
    S3)
    aws s3 ls --region $1
    ;;
    RDS)
    aws rds describe-db-instances --region $1
    ;;
    DynamoDB)
    aws dynamodb list-tables --region $1
    ;;
    Lambda)
    aws lambda list-functions --region $1
    ;;
    CloudFront)
    aws cloudfront list-distributions --region $1
    ;;
    EBS)
    aws ec2 describe-volumes --region $1
    ;;
    SNS)
    aws sns list-topics --region $1
    ;;
    SQS)
    aws sqs list-queues --region $1
    ;;
    CloudWatch)
    aws cloudwatch describe-alarms --region $1
    ;;
    *)
    echo "Unsupported service: $2"
    exit 1
    ;;
esac
