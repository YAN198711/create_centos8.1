#!/bin/bash

cd ~

# ------------------------
# Node.jsのインストール
# ------------------------
curl -sL https://rpm.nodesource.com/setup_12.x | bash -
yum -y install nodejs

#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
#source ~/.bashrc
#nvm install stable

# ------------------------
# Cloud9のインストール
# ------------------------
yum install -y glibc-static epel-release
yum install -y npm --enablerepo=epel
cd ~
#git clone https://github.com/c9/core.git c9sdk
git clone https://github.com/YAN198711/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh

firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload

npm install forever -g
