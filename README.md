---
date: 2022-02-12T23:54:27+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "Raspberrypi 学习笔记"  # 文章标题
description: "纸上得来终觉浅，学到过知识点分分钟忘得一干二净，今后无论学什么，都做好笔记吧。"
url:  "posts/raspberrypi/README"  # 设置网页永久链接
tags: [ "Raspberrypi", "README" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

# Raspberrypi 学习笔记

> 纸上得来终觉浅，学到过知识点分分钟忘得一干二净，今后无论学什么，都做好笔记吧。

## 目录结构

- `assets/images`: 笔记配图
- `assets/templates`: 笔记模板
- `libraries`: 库
  - `libraries/tripartite`: 第三方库
- `quickstart`: 基础用法
- `tools`: 常用工具

## 基础用法

### 系统安装

- [Ubuntu 系统安装与基本配置](quickstart/install/ubuntu.md)
- [Raspberry Pi OS 系统安装与基本配置](quickstart/install/raspberrypios.md)
- [OpenWrt 系统安装与配置](quickstart/install/openwrt.md)

### 硬件配置

- [树莓派读写移动硬盘](quickstart/hhd.md)
- [安装 GPIO 驱动](quickstart/gpio.md)

### 软件设置

- [花生壳内网穿透](quickstart/oray.md)
- [安装 Snap Store](quickstart/snap.md)
- [安装配置 Golang](quickstart/golang.md)
- [设置开机自启动脚本](quickstart/reboot.md)
- [定时执行任务](quickstart/cron.md)

## 功能示例

- [NFS 文件系统安装与部署](examples/nfs.md)
- [Chia 配置](examples/chia.md)
- [树莓派 Ubuntu 系统安装 Selenium 和 Chrome 浏览器](examples/selenium.md)

## 第三方库

- [OpenCV 安装与测试](libraries/tripartite/opencv.md)

## 常用工具

- [代理软件和常用工具代理设置](tools/proxy.md)
- [OpenClash 问题与配置](tools/openwrt/openclash.md)
- [安装 FFmpeg](tools/ffmpeg.md)
- [安装 Docker](tools/docker.md)
- [NetData 实时监视性能和运行状况](tools/netdata.md)
- [安装第三方 OneDrive](tools/ubuntu/onedrive.md)
