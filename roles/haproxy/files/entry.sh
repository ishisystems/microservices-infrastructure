#!/bin/bash
adduser --disabled-password --gecos '' haproxy
adduser haproxy sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
su -m haproxy -c /home/haproxy/script.sh