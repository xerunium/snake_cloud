#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo dpkg --configure -a 
apt install docker
snap install docker
docker pull aschil/snake
docker run -d -p 8080:8080 aschil/snake
