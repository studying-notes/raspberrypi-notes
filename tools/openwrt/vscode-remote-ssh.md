---
date: 2022-05-13T09:35:25+08:00
author: "Rustle Karl"

title: "OpenWrt 开启 VSCode SSH 远程功能"
url:  "posts/raspberrypi/tools/openwrt/vscode-remote-ssh"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

```shell
opkg install tar

opkg install node
```

```shell
cd .vscode-server/bin/long_hash/
```

```shell
rm node
```

```shell
which node

# 替换自带
cp /usr/bin/node node
```
