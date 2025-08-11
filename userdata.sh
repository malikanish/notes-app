#!/bin/bash
# Update packages
sudo yum update -y

# Install Docker
sudo amazon-linux-extras enable docker
sudo yum install -y docker
sudo service docker start
sudo systemctl enable docker

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Login to AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 014498660251.dkr.ecr.us-east-1.amazonaws.com

# Pull and run container
docker pull 014498660251.dkr.ecr.us-east-1.amazonaws.com/myapp-repo:latest
docker run -d -p 8000:8000 014498660251.dkr.ecr.us-east-1.amazonaws.com/myapp-repo:latest
