#!/bin/bash
cd ~/Downloads/
host=ec2-3-91-180-109.compute-1.amazonaws.com
username="ubuntu@"
echo $username
for i in $host; do 
ssh -i "aws_key.pem" $username$i << EOF
  sudo apt-get update; 
  mkdir /home/ubuntu/test3
EOF
done
#sudo apt-get install docker -y 