#!/bin/sh
exec sudo apt update
&&
## Install Docker Repository
exec sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
&&
exec curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
&&
exec sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
&&
## Install Docker

exec sudo apt-get install docker-ce docker-ce-cli containerd.io

&&
## Add Docker Group 
exec sudo groupadd docker
&&
exec newgrp docker
&&
exec sudo usermod -aG docker $USER
&&

## Test Docker Install
exec sudo docker run hello-world
&&
## Enable Docker to Start on BOOT
exec  sudo systemctl enable docker
&&
## install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
&&
## Make Docker Executable
sudo chmod +x /usr/local/bin/docker-compose
