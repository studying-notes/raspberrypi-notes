---
date: 2022-05-12T23:44:15+08:00
author: "Rustle Karl"

title: "syncthing 同步备份数据"
url:  "posts/raspberrypi/tools/openwrt/syncthing"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## 安装软件

### OpenWrt

```shell
opkg install luci-app-syncthing syncthing luci-i18n-syncthing-zh-cn
```

### Ubuntu

```shell
# Add the release PGP keys:
sudo curl -s -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
```

```shell
# Add the "stable" channel to your APT sources:
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
```

```shell
# Add the "candidate" channel to your APT sources:
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
```

```shell
# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing
```

## 启动程序

```shell
setsid syncthing serve --home=/root --gui-address=0.0.0.0:8384 &
```

## 增加监视数据

```shell
echo "fs.inotify.max_user_watches=204800" | sudo tee -a /etc/sysctl.conf
```
