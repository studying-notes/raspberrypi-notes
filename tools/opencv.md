---
date: 2021-03-19T09:38:57+08:00  # 创建日期
author: "Rustle Karl"

title: "OpenCV 安装与测试"
url:  "posts/raspberrypi/libraries/tripartite/opencv"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

手动编译很复杂，现在似乎已经可以直接通过 pip 安装。

```shell
pip install opencv-contrib-python
```

## 测试

```shell
root@raspberrypi:~# python
Python 3.9.2 (default, Feb 28 2021, 17:03:44)
[GCC 10.2.1 20210110] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> cv2.__version__
'4.5.5'
>>>
```
