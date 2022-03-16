---
date: 2021-06-21T08:36:35+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "定时执行任务"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/quickstart/cron"  # 设置网页永久链接
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
```

```bash
25 14 * * mon /usr/bin/docker restart gitea

5 1 * * * /bin/bash /root/projects/scripts/cron/morning.sh
25 14 * * mon /bin/bash /root/projects/scripts/cron/weekly.sh
30 17 * * * /bin/bash /root/projects/scripts/cron/evening.sh
```
