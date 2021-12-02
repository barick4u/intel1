#!/bin/bash
cd ~/Downloads/ # switching to my dir wher i have stored the key for my instance.
host=ec2-3-91-180-109.compute-1.amazonaws.com # this is dynamic, changes all the time if not static
username="ubuntu@"
echo $username
for i in $host; do 
ssh -i "aws_key.pem" $username$i << EOF
  sudo apt-get update; # updating the the ubunut image
  sudo apt install docker.io; #installing docker
  sudo apt install docker; 
  sudo systemctl start docker; #starting docker 
  sudo docker run -p 8080:8080 jenkins/jenkins:lts-jdk11 # exposing the port 8080 for jenkins. ref https://github.com/jenkinsci/docker/blob/master/README.md
EOF
done
#sudo apt-get install docker -y 