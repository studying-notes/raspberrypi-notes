---
date: 2021-01-01T17:36:09+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派安装 Docker"  # 文章标题
url:  "posts/examples/docker"  # 设置网页链接，默认使用文件名
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
- [检查版本](#检查版本)
- [卸载](#卸载)
- [修改镜像源和配置等](#修改镜像源和配置等)
  - [修改配置文件](#修改配置文件)
  - [使配置文件生效](#使配置文件生效)
  - [重启 Docker](#重启-docker)
- [安装 Docker Compose](#安装-docker-compose)
- [MongoDB](#mongodb)
- [Gitea](#gitea)
- [Swagger Editor](#swagger-editor)
- [MySQL](#mysql)
- [Redis](#redis)
- [Nginx](#nginx)
  - [TODO](#todo)

## 迁移文件位置

```shell
ln -s /mnt/sda/dockerd /var/lib/docker
```

## 一键安装

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
echo '
{
  "registry-mirrors": [
    "http://ovfftd6p.mirror.aliyuncs.com",
    "http://registry.docker-cn.com",
    "http://docker.mirrors.ustc.edu.cn",
    "http://hub-mirror.c.163.com"
  ],
  "insecure-registries": [
    "registry.docker-cn.com",
    "docker.mirrors.ustc.edu.cn"
  ],
  "debug": true,
  "experimental": true
}
' > /etc/docker/daemon.json
```

### 使配置文件生效

```shell
systemctl daemon-reload
```

### 重启 Docker

```shell
systemctl restart docker
```

## 安装 Docker Compose

```shell
pip install docker-compose
```

## MongoDB

```shell
docker pull mongo
```

```shell
docker run --restart=always -d --name mongo -p 27017:27017 -v /mnt/sda/docker/mongo:/data/db mongo
```

```shell
docker rm -f mongo
```

## Gitea

```shell
docker pull patrickthedev/gitea-rpi
```

```shell
docker run --restart=always -d --name gitea -p 10022:22 -p 13000:3000 -v /mnt/sda/docker/gitea:/data -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro patrickthedev/gitea-rpi
```

## Swagger Editor

```shell
docker pull swaggerapi/swagger-editor
```

```shell
docker run --restart=always -d -p 18080:8080 swaggerapi/swagger-editor
```

## MySQL

```shell
docker pull arm64v8/mariadb
```

```shell
docker run --restart=always -itd --name mariadb -v /mnt/sda/docker/mysql:/var/lib/mysql -p 3306:3306 -e MARIADB_ROOT_PASSWORD=root arm64v8/mariadb
```

- `-p 3306:3306` ：映射容器服务的 3306 端口到宿主机的 3306 端口，外部主机可以直接通过宿主机 `ip:3306` 访问到 MySQL 的服务
- `MYSQL_ROOT_PASSWORD=root`：设置 MySQL 服务 root 用户的密码

## Redis

```shell
docker pull redis
```

```shell
docker run --restart=always -v /mnt/sda/docker/redis/data:/data --name redis -p 6379:6379 -d redis --appendonly yes
```

## Nginx

```shell
docker pull nginx
```

### TODO

```shell
docker run --restart=always -d -p 80:80 -p 443:443 --name nginx -v /mnt/sda/mirror:/mirror -v /mnt/sda/docker/nginx/nginx.conf:/etc/nginx/nginx.conf nginx
```

```shell

```

```shell

```
