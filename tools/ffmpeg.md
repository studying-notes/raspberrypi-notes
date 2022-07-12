---
date: 2022-03-16T21:36:38+08:00
author: "Rustle Karl"

title: "安装 FFmpeg"
url:  "posts/raspberrypi/tools/ffmpeg"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## 官方仓库

### Ubuntu

```bash
apt install -y ffmpeg
```

### OpenWrt

```bash
opkg install ffmpeg ffprobe
```

## 手动编译

树莓派使用默认的 ffmpeg 进行转码，是使用 CPU 进行转码的，效率是非常低的。我们可以通过使用源码编译的方式来安装 ffmpeg，就可以使用硬件加速转码了。

https://pimylifeup.com/compiling-ffmpeg-raspberry-pi/

浪费时间了，手动编译很费时间，而且 CPU 仍然占用很高。

不如官方仓库下载。
