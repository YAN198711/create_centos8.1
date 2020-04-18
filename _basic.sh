#!/bin/bash

cd ~
# ------------------------
# システムのアップデート
# ------------------------
yum -y update

# ------------------------
# タイムゾーンの変更
# ------------------------
timedatectl set-timezone Asia/Tokyo

# ------------------------
# 日本語化
# ------------------------
yum -y install ibus-kkc vlgothic-*
localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf
echo $LANG
