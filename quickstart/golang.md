---
date: 2022-03-16T22:18:26+08:00
author: "Rustle Karl"

title: "安装配置 Golang"
url:  "posts/raspberrypi/quickstart/golang"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

```shell
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-arm64.tar.gz
```

```
vim ~/.profile
```

```shell
export PATH=$PATH:/usr/local/go/bin
```