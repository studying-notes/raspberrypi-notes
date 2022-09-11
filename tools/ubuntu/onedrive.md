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

## 安装依赖

```shell
apt install -y build-essential libcurl4-openssl-dev libsqlite3-dev pkg-config git libnotify-dev curl
```

## 下载编译器

```shell
mkdir -p ~/Downloads && cd ~/Downloads
```

设置 Git 代理：

```shell
git config --global http.https://github.com.proxy http://192.168.0.16:7890
```

```shell
curl -fsS https://dlang.org/install.sh | bash -s ldc
```

```shell
source ~/dlang/ldc-1.30.0/activate.fish
```

## 下载源码

```shell
git clone https://github.com/abraunegg/onedrive.git
```

```shell
cd onedrive
```

## 编译器配置

```shell
./configure DC=/root/dlang/ldc-1.30.0/bin/ldmd2
```

## 编译

```shell
make clean; make
```

## 安装

```shell
make install
```

```shell
deactivate
```

```shell
onedrive --version
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
curl -fsSL https://raw.githubusercontent.com/abraunegg/onedrive/master/config -o ~/.config/onedrive/config
```

```shell
vim ~/.config/onedrive/config
```

## 自启服务

```shell
systemctl --user enable onedrive
systemctl --user start onedrive
systemctl --user stop onedrive
systemctl --user restart onedrive
systemctl --user status onedrive
```

## 查看日志

```shell
journalctl --user-unit=onedrive -f
```
