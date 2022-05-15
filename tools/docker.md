---
date: 2021-01-01T17:36:09+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "安装 Docker"  # 文章标题
url:  "posts/tools/docker"  # 设置网页链接，默认使用文件名
tags: [ "raspberrypi", "docker"]  # 标签
series: [ "树莓派学习笔记",  "Docker 从入门到放弃" ]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

- [迁移文件位置](#迁移文件位置)
- [一键安装](#一键安装)
  - [Ubuntu & Raspberry Pi](#ubuntu--raspberry-pi)
  - [OpenWrt](#openwrt)
- [检查版本](#检查版本)
- [卸载](#卸载)
- [修改镜像源和配置等](#修改镜像源和配置等)
  - [修改配置文件](#修改配置文件)
  - [Ubuntu 使配置文件生效](#ubuntu-使配置文件生效)
  - [重启 Docker](#重启-docker)
- [安装 Docker Compose](#安装-docker-compose)

## 迁移文件位置

> 不必要，可通过后期配置修改存储位置

```shell
ln -s /mnt/sda/lib/docker /var/lib/docker

# or (openwrt)
ln -s /mnt/sda/opt/docker /opt/docker
```

## 一键安装

### Ubuntu & Raspberry Pi

```shell
curl -fsSL https://get.docker.com -o get-docker.sh
```

```shell
sh get-docker.sh -s docker --mirror Aliyun
```

> 不限系统，可以是树莓派官方，也可以是 Ubuntu。

```shell
usermod -aG docker root
```

### OpenWrt

```shell
opkg install dockerd docker docker-compose
opkg install python3-docker python3-docker-src
opkg install luci-app-docker luci-app-dockerman luci-lib-docker --force-overwrite
# /etc/docker/daemon.json 会被重写覆盖，需注意
```

## 检查版本

```shell
docker version
```

## 卸载

```shell
apt -y purge docker-ce
```

```shell
apt -y purge docker-ce-cli
```

## 修改镜像源和配置等

> 基本都不免费提供了，中科大已经重定向阿里云。

### 修改配置文件

```shell
docker info
```

```shell
cat /etc/docker/daemon.json
vim /etc/docker/daemon.json


# openwrt
cat /etc/init.d/dockerd

# openwrt 这个文件才是有用的
vim /etc/config/dockerd
# 把其中的 alt_config_file 取消注释
```

```
src\tools\docker\linux.config.json
src\tools\docker\windows.config.json
```

Windows 下用户目录 .docker 中

### Ubuntu 使配置文件生效

```shell
systemctl daemon-reload
```

### 重启 Docker

```shell
# openwrt
/etc/init.d/dockerd start
/etc/init.d/dockerd stop
/etc/init.d/dockerd restart

systemctl restart docker
```

## 安装 Docker Compose

```shell
pip install -U docker-compose
```
