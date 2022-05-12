---
date: 2022-03-16T22:18:26+08:00
author: "Rustle Karl"

title: "Linux 安装配置 Golang"
url:  "posts/raspberrypi/quickstart/golang"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## 从源码安装

> 无法自动更新

```shell
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-arm64.tar.gz
```

```shell
vim ~/.profile
```

```shell
export PATH=$PATH:/usr/local/go/bin
```

## 从 snap 安装

> 自动更新

```shell
snap install go --classic
```

## Go 模块代理

```shell
go env -w GOPROXY=https://goproxy.cn,direct
go env -w GOSUMDB=off
go env -w GO111MODULE=on
```
