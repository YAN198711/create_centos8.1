#!/bin/bash

cd ~

# ------------------------
# リモートデスクトップ接続の準備
# ------------------------
#yum -y install epel-release
yum -y install --enablerepo=epel xrdp tigervnc-server

systemctl start xrdp.service
systemctl enable xrdp.service

#rpm -qa | grep xrdp
#rpm -qa | grep tigervnc-server

#cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.original

#vi /etc/xrdp/xrdp.ini
#sudo sed -e 's/max_bpp=24/max_bpp=32/g' /etc/xrdp/xrdp.ini > /etc/xrdp/xrdp.ini

systemctl start firewalld
systemctl enable firewalld.service
firewall-cmd --permanent --zone=public --add-port=3389/tcp
firewall-cmd --permanent --zone=public --add-port=5900/tcp
firewall-cmd --permanent --zone=public --add-port=5901/tcp
firewall-cmd --reload
