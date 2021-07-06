---
date: 2021-01-01T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派 Ubuntu 系统安装与基本配置"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/ubuntu"  # 设置网页永久链接
tags: [ "raspberrypi", "config"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 默认密码

ubuntu sever 默认用户密码

ubuntu@ubuntu

ssh ubuntu@192.168.199.218

## WiFi 联网设置

https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#3-wifi-or-ethernet

```shell
vim /etc/netplan/50-cloud-init.yaml
```

```shell
cat /etc/netplan/50-cloud-init.yaml
```

```yaml
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
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
                        "DAOLIAN":
                                password: "1122334455"
                    dhcp4: true
```

## 换源

https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu-ports/

```shell
echo "
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted universe multiverse
" > /etc/apt/sources.list
```

```shell
apt-get update && apt-get upgrade -y
```

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
pip3 install toolkit-py -i https://pypi.douban.com/simple  # 个人工具包

pip3 uninstall -y toolkit-py # 个人工具包
```

```shell
chs # 换源
```

## Go

```shell
snap install go --classic
```

```shell

```
```shell

```

```shell

```

## 无线手柄

```shell
pip install spidev
```

```shell
apt-get -y install python3-rpi.gpio python3-pip
```
