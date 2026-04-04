#! /bin/bash

apt update -y
apt install docker.io -y
systemctl start docker
chmod 666 /var/run/docker.sock
apt install git
