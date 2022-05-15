---
date: 2022-05-11T19:54:08+08:00
author: "Rustle Karl"

title: "OpenClash 问题与配置"
url:  "posts/raspberrypi/tools/openwrt/openclash"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## GeoSite 数据库下载失败

```shell
ps | grep clash
```

```shell
cat /usr/share/openclash/openclash_geosite.sh
```

```shell
# 暂时用其他代理
wget -e use_proxy=yes -e http_proxy=192.168.0.12:7890 -e https_proxy=192.168.0.12:7890 https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat
```

```shell
cp geosite.dat /etc/openclash/GeoSite.dat
```

## 配置文件订阅

然后启动即可，其他保持默认即可。

## 测试

```shell
curl http://www.google.com
```

无需设置代理，已经自动代理了。
