---
date: 2021-02-05T20:44:27+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派 Torrent 下载器"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/torrent"  # 设置网页永久链接
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

```shell
docker run -d \
  --name=qbittorrent \
  -e PUID=1000 \
  -e PGID=1000 \
  -e WEBUI_PORT=8080 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 8080:8080 \
  -v /mnt/storage/service/qbittorrent:/config \
  -v /mnt/storage/vsftp/Download:/downloads \
  --restart unless-stopped \
  ghcr.io/linuxserver/qbittorrent
```

admin
adminadmin
