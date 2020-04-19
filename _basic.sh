#!/bin/bash

cd ~

# システムのアップデート
dnf -y upgrade
#yum -y update

# 開発ツールのインストール
dnf -y groupinstall standard
dnf -y groupinstall development

# タイムゾーンの変更
timedatectl set-timezone Asia/Tokyo


# 日本語化
dnf -y install langpacks-ja
#yum -y install ibus-kkc vlgothic-*
localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf
#echo $LANG