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

## 默认用户名与密码

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

## 开启 SSH 服务

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
ssh-copy-id -i ~/.ssh/id_rsa.pub root@master
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.0.118
ssh-copy-id -i ~/.ssh/id_rsa.pub root@raspberrypi
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
