---
date: 2021-01-01T17:36:09+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "Linux 安装 Docker"  # 文章标题
url:  "posts/tools/ubuntu/docker"  # 设置网页链接，默认使用文件名
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

- [一键安装](#一键安装)
- [检查版本](#检查版本)
- [卸载](#卸载)
- [修改镜像源和配置等](#修改镜像源和配置等)
  - [修改配置文件](#修改配置文件)
  - [Ubuntu 使配置文件生效](#ubuntu-使配置文件生效)
  - [重启 Docker](#重启-docker)
- [安装 Docker Compose](#安装-docker-compose)

## 一键安装

官方支持：

```shell
apt install -y docker.io
```

```shell
apt install -y curl
```

```shell
curl -fsSL https://get.docker.com -o get-docker.sh
```

```shell
sh get-docker.sh -s docker --mirror Aliyun
```

无语的，阿里云限速了。。。不如官方：

```shell
sh get-docker.sh -s docker
```

> 不限系统，可以是树莓派官方，也可以是 Ubuntu。

```shell
usermod -aG docker root
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

### 修改配置文件

```shell
docker info
```

```shell
vim /etc/docker/daemon.json
```

```
{
  "insecure-registries": [
    "192.168.0.16:5000"
  ],
  "registry-mirrors": [
    "http://192.168.0.16:5000",
    "https://ba0d43c4ea0f4de5a5528e288a251804.mirror.swr.myhuaweicloud.com"
  ]
}
```

Windows 下用户目录 .docker 中

### Ubuntu 使配置文件生效

```shell
systemctl daemon-reload
```

### 重启 Docker

```shell
systemctl restart docker
```

## 安装 Docker Compose

```shell
pip install -U docker-compose
```
