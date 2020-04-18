#!/bin/bash

cd ~

# ------------------------
# Pyenvのインストール
# ------------------------
yum -y install gcc g++ gcc-c++ kernel-devel bzip2 bzip2-devel openssl openssl-devel readline readline-devel sqlite-devel tk-devel libffi-devel python-devel libxslt-devel libffi-devel
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
pyenv install 3.7.2
pyenv global 3.7.2
pyenv rehash

# ------------------------
# pipインストール
# ------------------------
pip install --upgrade pip
pip install -r ~/create_centos8.1/requirements.txt

# ------------------------
# TA-Libのインストール
# ------------------------
cd ~
wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar -zxvf ta-lib-0.4.0-src.tar.gz
cd ta-lib
#./configure --prefix=/root/.pyenv/versions/3.7.2/
./configure --prefix=/usr
make
make install
echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig
cd ../
rm -rf ta-lib-0.4.0-src.tar.gz
pip install TA-Lib
rm -rf ta-lib
cd ~
