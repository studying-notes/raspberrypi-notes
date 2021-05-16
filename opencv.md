---
date: 2021-03-19T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派编译 OpenCV"  # 文章标题
url:  "posts/raspberrypi/opencv"  # 设置网页永久链接
tags: [ "raspberrypi", "opencv"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 依赖

```shell
apt-get update && apt-get upgrade -y
```

```shell
apt-get install -y cmake build-essential pkg-config git libjpeg-dev libtiff-dev libjasper-dev libpng-dev libwebp-dev libopenexr-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libdc1394-22-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev  libgtk-3-dev libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5 python3-numpy
```

## 编译

```shell
git clone https://gitee.com/fujiawei/opencv.git
```

```shell
git clone https://gitee.com/fujiawei/opencv_contrib.git
```

```shell
mkdir ~/opencv/build && cd ~/opencv/build
```

> 如果内存不足，可以设置更多的交换空间

```shell
sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
systemctl restart dphys-swapfile
```

> 完成后取消

```shell
sudo sed -i 's/CONF_SWAPSIZE=1024/CONF_SWAPSIZE=100/g' /etc/dphys-swapfile
systemctl restart dphys-swapfile
```

```shell
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules -D ENABLE_NEON=ON -D ENABLE_VFPV3=ON -D BUILD_TESTS=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D OPENCV_ENABLE_NONFREE=ON -D CMAKE_SHARED_LINKER_FLAGS=-latomic -D BUILD_EXAMPLES=OFF ..
```

```shell
make -j$(nproc)
```

```shell
make install
```

```shell
ldconfig
```

## 测试

```shell
root@raspberrypi:~/opencv/build# python3
Python 3.7.3 (default, Jul 25 2020, 13:03:44)
[GCC 8.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> cv2.__version__
'4.5.2-pre'
>>>
```

```shell

```

```shell

```

```shell

```

```shell

```

```shell

```

```shell

```






