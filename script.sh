#! /bin/bash

apt update -y
apt install docker -y
systemctl start docker
apt install git
