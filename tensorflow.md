---
date: 2021-03-19T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派安装 Tensorflow"  # 文章标题
url:  "posts/raspberrypi/tensorflow"  # 设置网页永久链接
tags: [ "raspberrypi", "opetensorflowncv"]  # 标签
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

```

```shell
apt-get install -y libhdf5-dev libc-ares-dev libeigen3-dev gcc gfortran python-dev libgfortran5 \
             libatlas3-base libatlas-base-dev libopenblas-dev libopenblas-base libblas-dev \
             liblapack-dev cython libatlas-base-dev openmpi-bin libopenmpi-dev python3-dev
```

```shell
pip3 install keras_applications==1.0.8 --no-deps
```

```shell
pip3 install keras_preprocessing==1.1.0 --no-deps
```

### 设置代理

```shell
export http_proxy=192.168.199.140:7890
export https_proxy=192.168.199.140:7890
```

```shell
wget "https://raw.githubusercontent.com/PINTO0309/Tensorflow-bin/master/tensorflow-2.2.0-cp37-cp37m-linux_armv7l_download.sh"
```

```shell
bash tensorflow-2.2.0-cp37-cp37m-linux_armv7l_download.sh
```
```shell
pip3 uninstall tensorflow
```
```shell
pip3 install tensorflow-2.2.0-cp37-cp37m-linux_armv7l.whl
```

```shell

```
