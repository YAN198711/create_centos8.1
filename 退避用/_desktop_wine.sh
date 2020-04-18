#!/bin/bash

cd ~

# ------------------------
# デスクトップのインストール
# ------------------------
yum -y install epel-release
yum -y groupinstall "GNOME Desktop"
yum -y --enablerepo=epel groupinstall "MATE Desktop"
echo "PREFERRED=/usr/bin/mate-session" > /etc/sysconfig/desktop

# ------------------------
# WINETRICKSのインストール
# ------------------------
yum -y install wine --enablerepo=epel
yum -y --enablerepo=epel install cabextract
#yum -y install cabextract

mkdir bin
cd bin
wget http://www.kegel.com/wine/winetricks
#wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
#cp ./winetricks /usr/local/bin
winetricks allfonts
cd ~

# ------------------------
# WINEのインストール
# ------------------------
yum -y remove wine
yum -y erase wine wine-*

yum -y install samba-winbind-clients
yum -y groupinstall 'Development Tools'
yum -y install glibc-devel.{i686,x86_64} gnutls-devel.{i686,x86_64} freetype-devel.{i686,x86_64} alsa-lib-devel.{i686,x86_64}
yum -y install libtiff-devel.{i686,x86_64} libgcc.{i686,x86_64} libX11-devel.{i686,x86_64} libxml2-devel.{i686,x86_64}
yum -y install libjpeg-turbo-devel.{i686,x86_64} libpng-devel.{i686,x86_64} libXrender-devel.{i686,x86_64}

mkdir wine
cd wine
wget https://dl.winehq.org/wine/source/4.0/wine-4.0.tar.xz
tar Jxfv wine-4.0.tar.xz
#wget http://dl.winehq.org/wine/source/3.x/wine-3.15.tar.xz
#tar Jxfv wine-3.15.tar.xz
cd wine-4.0
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
