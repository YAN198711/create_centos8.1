#!/bin/bash

cd ~

# デスクトップのインストール
dnf --enablerepo=epel group -y install "Xfce" "base-x"
echo "exec /usr/bin/xfce4-session" >> ~/.xinitrc


# リモートデスクトップ接続の準備
dnf -y install xrdp tigervnc-server
systemctl enable xrdp --now
firewall-cmd --add-port=3389/tcp --permanent
firewall-cmd --reload
