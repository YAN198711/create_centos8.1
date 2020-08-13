#!/bin/bash

cd ~

# ------------------------
# リモートデスクトップ接続の準備
# ------------------------
dnf -y install epel-release
dnf -y install --enablerepo=epel xrdp tigervnc-server

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
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=81/tcp
firewall-cmd --permanent --zone=public --add-port=82/tcp
firewall-cmd --permanent --zone=public --add-port=83/tcp
firewall-cmd --permanent --zone=public --add-port=84/tcp
firewall-cmd --reload


# ------------------------
# デスクトップのインストール
# ------------------------
dnf -y  groupinstall "Server with GUI"
systemctl set-default graphical

#yum -y install epel-release
#yum -y groupinstall "GNOME Desktop"
#yum -y --enablerepo=epel groupinstall "MATE Desktop"
#echo "PREFERRED=/usr/bin/mate-session" > /etc/sysconfig/desktop

# ------------------------
# WINETRICKSのインストール
# ------------------------
mkdir bin
cd bin
wget http://www.kegel.com/wine/winetricks
chmod +x winetricks
#winetricks

# ------------------------
# WINEのインストール
# ------------------------
dnf -y remove wine
dnf -y erase wine wine-*

dnf -y install samba-winbind-clients
dnf -y groupinstall 'Development Tools'
dnf -y install glibc-devel.{i686,x86_64} gnutls-devel.{i686,x86_64} freetype-devel.{i686,x86_64} alsa-lib-devel.{i686,x86_64}
dnf -y install libtiff-devel.{i686,x86_64} libgcc.{i686,x86_64} libX11-devel.{i686,x86_64} libxml2-devel.{i686,x86_64}
dnf -y install libjpeg-turbo-devel.{i686,x86_64} libpng-devel.{i686,x86_64} libXrender-devel.{i686,x86_64}

mkdir wine
cd wine
wget wget https://dl.winehq.org/wine/source/5.0/wine-5.0.tar.xz
tar Jxfv wine-5.0.tar.xz
#wget http://dl.winehq.org/wine/source/3.x/wine-3.15.tar.xz
#tar Jxfv wine-3.15.tar.xz
cd wine-5.0
mkdir -p wine32 wine64
cd wine64
../configure --enable-win64
make
cd ../wine32
../configure --with-wine64=../wine64
make
cd ../wine32
make install
cd ../wine64
make install

cd ~
