#!/bin/bash

set -e

# "installing jenkins repo"

sudo curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

echo "Importing jenkins key file"

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# "configuring java service"

sudo yum install -y fontconfig java-21-openjdk
sudo yum install -y jenkins

sudo systemctl daemon-reload

sudo systemctl enable jenkins
sudo systemctl start jenkins

# For Agent
# "configuring docker"
# Do this docker config seperately
# sudo yum install -y fontconfig java-21-openjdk
# #install maven aswell if you dont install from pipeline ( sudo yum install -y maven) 
# sudo dnf -y install dnf-plugins-core
# sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
# sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# sudo systemctl enable --now docker
# sudo systemctl start docker
# sudo systemctl enable docker
# sudo usermod -aG docker ec2-user 
