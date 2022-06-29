---
date: 2022-03-16T21:09:32+08:00
author: "Rustle Karl"

title: "Linux 系统花生壳内网穿透"
url:  "posts/raspberrypi/tools/oray"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

https://hsk.oray.com/download/

## 基本依赖

```shell
apt install -y net-tools wget
```

## Raspberry 系统

> ARM64 位

```shell
wget "https://down.oray.com/hsk/linux/phddns_5.1.0_rapi_aarch64.deb" -O phddns_rapi_aarch64.deb
```

```shell
dpkg -i phddns_rapi_aarch64.deb
```

## Ubuntu 系统

> AMD64 位

```shell
wget "https://down.oray.com/hsk/linux/phddns_5.2.0_amd64.deb" -O phddns_5.2.0_amd64.deb
```

```shell
dpkg -i phddns_5.2.0_amd64.deb
```
