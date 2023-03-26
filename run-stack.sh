#!/bin/bash

aws cloudformation $ACTION \
    --region us-east-1 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=451561843959.dkr.ecr.us-east-1.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-ae619dd3 \
    ParameterKey=Cluster,ParameterValue=default \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-east-1:451561843959:listener/app/production-website/024aa08aee6ccadb/9ceb2d86a069ed5f
