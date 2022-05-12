---
date: 2022-03-16T21:18:02+08:00
author: "Rustle Karl"

title: "安装第三方 OneDrive"
url:  "posts/raspberrypi/tools/ubuntu/onedrive"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## 链接到外部存储

有必要的情况下：

```shell
mkdir -p /mnt/sda/onedrive

ln -s  /mnt/sda/onedrive ~/OneDrive
ln -s /media/root/Linux/OneDrive ~/OneDrive
```

```shell
mkdir -p /mnt/sda/download

ln -s  /mnt/sda/download ~/Downloads
```

## 安装依赖

```shell
apt install -y build-essential libcurl4-openssl-dev libsqlite3-dev pkg-config git libnotify-dev curl
```

## 下载编译器

```shell
mkdir -p ~/Downloads && cd ~/Downloads
```

```shell
git config --global http.https://github.com.proxy http://192.168.0.117:8118
curl -x 192.168.0.117:8118 -fsS https://dlang.org/install.sh | bash -s ldc
```

## 下载源码

```shell
git clone https://github.com/abraunegg/onedrive.git
```

```shell
cd onedrive
```

```shell
./configure DC=~/dlang/ldc-1.29.0/bin/ldmd2
```

```shell
make clean; make
```

```shell
make install
```

```shell
deactivate
```

```shell
onedrive
```

点击链接激活即可

## 配置文件

```shell
mkdir -p ~/.config/onedrive
```

```shell
curl -x 192.168.0.117:8118 -fsSL https://raw.githubusercontent.com/abraunegg/onedrive/master/config -o ~/.config/onedrive/config
```

```shell
vim ~/.config/onedrive/config
```

```shell
systemctl --user enable onedrive
systemctl --user start onedrive
systemctl --user stop onedrive
systemctl --user restart onedrive
systemctl --user status onedrive
```

查看日志：

```shell
journalctl --user-unit=onedrive -f
```
