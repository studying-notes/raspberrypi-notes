---
date: 2021-06-21T08:36:35+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "定时执行任务"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/docs/cron"  # 设置网页永久链接
tags: ["cron"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

```bash
crontab -e
# 写入内容
# 0 1 * * 1-5 /usr/bin/rm -rf /tmp/*
```

At 14:25 on Monday.

```bash
25 14 * * mon /usr/bin/docker restart gitea
```

```bash

```

```bash

```
