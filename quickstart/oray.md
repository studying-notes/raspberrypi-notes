---
date: 2022-03-16T21:09:32+08:00
author: "Rustle Karl"

title: "Linux 系统花生壳内网穿透"
url:  "posts/raspberrypi/quickstart/oray"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

```shell
apt install net-tools -y
```

## Raspberry 系统

```shell
apt update

apt install -y wget

wget "https://dl-cdn.oray.com/hsk/linux/phddns_5.1.0_rapi_aarch64.deb" -O phddns_rapi_aarch64.deb

apt install -fy ./phddns_rapi_aarch64.deb
```

## Ubuntu 系统

wget "https://down.oray.com/hsk/linux/phddns_5.2.0_amd64.deb" -O phddns_5.2.0_amd64.deb

```shell
dpkg -i phddns_5.2.0_amd64.deb
```
