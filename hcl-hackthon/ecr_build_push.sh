#!/bin/bash

# Variables
AWS_REGION=us-east-1
ECR_REPO="my-nodejs-app"
IMAGE_TAG="latest"

# Get Account ID
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

# Authenticate Docker to AWS ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Build Docker image
docker build -t $ECR_REPO .

# Tag image
docker tag $ECR_REPO:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG

# Push image to ECR
docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG


#To run this app use : chmod +x build_push_ecr.sh ./build_push_ecr.sh
