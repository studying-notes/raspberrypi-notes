---
date: 2022-06-28T15:54:56+08:00
author: "Rustle Karl"

title: "OpenWrt 问题记录"
url:  "posts/respberrypi/docs/openwrt/question"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
categories: [ "Raspberrypi 学习笔记" ]

toc: true  # 目录
draft: false  # 草稿
---

## 防火墙

莫名其妙拦截 Docker 的端口映射，导致非本机无法访问容器暴露出来的端口。

目前只能每次重启防火墙，然后重启 Docker。

有可能是 OpenClash 的问题。

## SSH 同时登陆数量

一个 IP 同时只能登陆 4 个 SSH，暂时无解。

## 无法联网

可以 Ping 外网，可以代理上网，但就是无法 IP/TCP 直接建立连接。

IP 被占用了，或者非允许网段，换一个 IP

## VSCode SSH 远程功能

```shell
opkg install tar node
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

## Docker 配置无效

```shell
killall /usr/bin/dockerd
```

然后 Web 界面启动 Docker。

```shell

```
