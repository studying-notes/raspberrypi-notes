---
date: 2021-01-01T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "Ubuntu 系统安装与基本配置"  # 文章标题
url:  "posts/raspberrypi/docs/ubuntu/install"  # 设置网页永久链接
tags: [ "raspberrypi", "config"]
categories: [ "Raspberrypi 学习笔记" ]

index: true
toc: true
draft: false
---

## 开启 SSH 服务

```shell
apt install -y openssh-server
```

### 开机自启

```shell
systemctl enable ssh.service
```

### 启用 root 登录

1. 设置 root 用户密码

```shell
passwd root
```

```shell
root
```

2. 添加设置

```shell
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
```

```shell
sed -i "s/PermitRootLogin prohibit-password/#PermitRootLogin prohibit-password/g" /etc/ssh/sshd_config
```

3. 重启服务

```shell
systemctl restart ssh
```

### 永久修改主机名

```shell
echo ubuntu-raspi-arm64 > /etc/hostname
```

```shell
# 重启
reboot
```

### 上传免密公钥

```shell
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.0.218
```

## 换源

http://mirrors.tuna.tsinghua.edu.cn/help/ubuntu-ports/

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

其他配置基本与 AMD64 一致，见 Linux 学习笔记。

## 基础软件

apt install -y vim

## Docker

[安装 Docker](../../tools/docker.md)

## Golang
