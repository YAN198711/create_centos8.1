#!/bin/bash

cd ~

# Chrome Driverのインストール
dnf -y install libX11 GConf2 fontconfig
#yum -y install libX11 GConf2 fontconfig ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts wget
wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver /usr/local/bin/
chmod 777 /usr/local/bin/chromedriver
rm -f chromedriver_linux64.zip
#chromedriver --version

# Google Chromeのインストール
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf -y localinstall google-chrome-stable_current_x86_64.rpm
#yum localinstall -y google-chrome-stable_current_x86_64.rpm
rm -f google-chrome-stable_current_x86_64.rpm
#google-chrome --version
