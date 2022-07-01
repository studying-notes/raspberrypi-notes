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

- [Golang 编译](#golang-编译)
- [防火墙](#防火墙)
- [SSH 同时登陆数量](#ssh-同时登陆数量)
- [无法联网](#无法联网)
- [VSCode SSH 远程功能](#vscode-ssh-远程功能)
- [Docker 配置无效](#docker-配置无效)

## Golang 编译

编译时出现 `cannot find -lpthread`，执行下面的命令：

```shell
ar -rc /usr/lib/libpthread.a
```

## 防火墙

莫名其妙拦截 Docker 的端口映射，导致非本机无法访问容器暴露出来的端口。

目前只能每次重启防火墙，然后重启 Docker。

有可能是 OpenClash 的问题。

终于知道是什么情况了，停止 Docker 容器后，没有删掉启动时添加的转发规则，导致再次启动时，如果 ip 与之前那一次不一样了，那么防火墙就有了两个转发规则，会转发到原来的规则，而那个已经跟现在不一样了。

找到重复的规则：

```shell
iptables -L DOCKER -t nat  --line-numbers
```

删除比较早的那一条：

```shell
iptables -t nat -D DOCKER 编号
```

干脆清空规则：

```shell
iptables -t nat -F DOCKER
```

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
