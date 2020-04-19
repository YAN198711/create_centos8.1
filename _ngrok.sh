#!/bin/bash
cd ~

# ngrokのインストール
#yum -y install unzip zip
curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
cp ngrok /usr/bin/
rm -f ngrok-stable-linux-amd64.zip

firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=81/tcp
firewall-cmd --permanent --zone=public --add-port=82/tcp
firewall-cmd --permanent --zone=public --add-port=83/tcp

firewall-cmd --reload