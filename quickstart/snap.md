---
date: 2022-03-16T21:15:08+08:00
author: "Rustle Karl"

title: "安装 Snap Store"
url:  "posts/raspberrypi/quickstart/snap"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

```shell
apt install -y snapd
```

```shell
systemctl daemon-reload
systemctl restart snapd
```

```shell
snap install snap-store
```

snap changes
snap refresh package

snap set system proxy.http="http://192.168.199.140:7890"
snap set system proxy.https="http://192.168.199.140:7890"

snap set system proxy.http="socks5://localhost:10808"
snap set system proxy.https="socks5://localhost:10808"

snap unset system proxy.http
snap unset system proxy.https
