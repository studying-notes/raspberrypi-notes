---
date: 2021-01-01T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "Ubuntu 系统安装与基本配置"  # 文章标题
url:  "posts/raspberrypi/quickstart/install/ubuntu"  # 设置网页永久链接
tags: [ "raspberrypi", "config"]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

- [默认用户名与密码](#默认用户名与密码)
- [WiFi 联网设置](#wifi-联网设置)
- [换源](#换源)
- [时间同步](#时间同步)
- [Python](#python)
- [Go](#go)

## 默认用户名与密码

好久不搞了，今天重装系统，居然发现登录后无法改密码。

```
passwd: Authentication token manipulation error
```

`user-data`

```
chpasswd:
  expire: false
  list:
  - ubuntu:ubuntu
```

```
ubuntu@ubuntu
```

## WiFi 联网设置

http://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#3-wifi-or-ethernet

```shell
cat /etc/netplan/50-cloud-init.yaml
```

编辑该文件，改成以下内容：

```yaml
network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
    version: 2
    wifis:
            wlan0:
                    optional: true
                    access-points:
                        "WiFi名称":
                                password: "WiFi密码"
                    dhcp4: true
```

## 换源

http://mirrors.tuna.tsinghua.edu.cn/help/ubuntu-ports/

```shell
echo "
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted universe multiverse
" > /etc/apt/sources.list
```

```shell
apt update && apt upgrade -y
```

可能会遇到锁问题，强制删除锁即可。

## 时间同步

```shell
apt install ntpdate -y
```

```shell
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && ntpdate time2.aliyun.com
```

## Python

```shell
ln -s /usr/bin/python3 /usr/bin/python
```

```shell
apt install -y python3-pip
```

```shell
ln -s /usr/bin/pip3 /usr/bin/pip
```

```shell
pip install toolkit-py -i https://pypi.douban.com/simple  # 个人工具包
```

```shell
cfm py
```

## Go

```shell
snap install go --classic
```
