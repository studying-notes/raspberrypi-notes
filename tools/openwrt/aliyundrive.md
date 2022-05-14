---
date: 2022-05-13T17:17:24+08:00
author: "Rustle Karl"

title: "阿里云盘 WebDAV 服务"
url:  "posts/raspberrypi/tools/openwrt/aliyundrive"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

```shell
wget https://github.com/messense/aliyundrive-webdav/releases/download/v1.3.2/aliyundrive-webdav_1.3.2-1_aarch64_cortex-a72.ipk
wget https://github.com/messense/aliyundrive-webdav/releases/download/v1.3.2/luci-app-aliyundrive-webdav_1.3.2_all.ipk
wget https://github.com/messense/aliyundrive-webdav/releases/download/v1.3.2/luci-i18n-aliyundrive-webdav-zh-cn_1.3.2-1_all.ipk
```

```shell
opkg install aliyundrive-webdav_1.3.2-1_aarch64_cortex-a72.ipk
opkg install luci-app-aliyundrive-webdav_1.3.2_all.ipk
opkg install luci-i18n-aliyundrive-webdav-zh-cn_1.3.2-1_all.ipk
```
