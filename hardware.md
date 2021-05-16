---
date: 2021-01-02T11:07:33+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派硬件"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/hardware"  # 设置网页永久链接
tags: [ "raspberrypi"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

![preview](https://i.loli.net/2021/01/02/1rqX5PipbZelNfk.jpg)

WIFI 性能大概 100 Mbps。

## 温度

```shell
cat /sys/class/thermal/thermal_zone0/temp # 除以 1000
```

```shell
watch -n 1 cat /sys/class/thermal/thermal_zone0/temp
```


cat /proc/loadavg
grep processor /proc/cpuinfo|wc -l

