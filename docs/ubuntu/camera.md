---
date: 2022-07-01T20:05:11+08:00
author: "Rustle Karl"

title: "Ubuntu Server 下给树莓派安装摄像头"
url:  "posts/raspberrypi/docs/ubuntu/camera"  # 永久链接
tags: ["Raspberrypi 学习笔记"]

toc: true # 目录
draft: false # 草稿
---

## 安装依赖

```shell
apt install raspi-config -y
```

## 打开设置

```shell
raspi-config
```

Interfacing Options -> P1 Camera -> enable

出现错误：

```
Your firmwave appears to be out of date (no start_x.elf). Please update
```

## 解决方法

查看 boot 分区所在的设备号，设备号可能是：/dev/mmcblk0p1

```shell
df -h
```

将该设备号挂载在/boot上

```shell
mount /dev/mmcblk0p1 /boot
```

重新设置，重启。

## 检查是否有摄像头设备

```shell
ls -al /dev/ | grep video
```

## 拍照测试

```shell
apt install -y fswebcam
```

```shell
fswebcam -d /dev/video0 camera.jpg
```

## 实时监控

```shell
ffmpeg -hide_banner -r 30  -i /dev/video0 -vcodec h264 -f segment -reset_timestamps 1 -strftime 1 -segment_time 360 door_%Y%m%d%H%M%S.mkv
```

```shell

```
