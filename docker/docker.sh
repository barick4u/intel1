#!/bin/bash
cd ~/Downloads/
host=ec2-3-91-180-109.compute-1.amazonaws.com
username="ubuntu@"
echo $username
for i in $host; do 
ssh -i "aws_key.pem" $username$i << EOF
  sudo apt-get update;
  sudo apt install docker.io;
  sudo apt install docker;
  sudo systemctl start docker;
  sudo docker run -p 8080:8080 jenkins/jenkins:lts-jdk11 #exposing the port 8080 for jenkins. ref https://github.com/jenkinsci/docker/blob/master/README.md
EOF
done
#sudo apt-get install docker -y 