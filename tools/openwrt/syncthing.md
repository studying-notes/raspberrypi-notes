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

建议 Docker。

## 启动程序

OpenWrt 安装后的启动脚本是存在问题的，导致根本无法启动，需要手动编辑 /etc/init.d/syncthing，根本原因是这个脚本与程序同名，导致判断条件错误。

## 增加监视数据

```shell
echo "fs.inotify.max_user_watches=204800" | tee -a /etc/sysctl.conf
```
