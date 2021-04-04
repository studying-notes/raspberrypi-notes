---
date: 2021-01-01T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派 Ubuntu 系统安装 Pillow"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/pillow"  # 设置网页永久链接
tags: [ "raspberrypi", "pillow"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

```shell
apt update && apt upgrade -y
```

```shell
apt install libjpeg-dev libjpeg8-dev libtiff5-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev
```

```shell
pip install pillow
```
