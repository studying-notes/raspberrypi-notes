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

### 安装 Fish 终端

Setp 1. 安装

```shell
apt install -y fish
```

Setp 2. 去掉欢迎语句

```shell
fish -c "set -U fish_greeting"
```

需进入 Fish 中设置才能生效。

```shell
set -U fish_greeting
```

Setp 3. 设置别名，自定义变量

```shell
vi ~/.config/fish/config.fish
source ~/.config/fish/config.fish
```

Setp 4. 修改默认终端

```shell
usermod -s `which fish`  root
```

恢复默认终端：

```shell
usermod -s `which bash`  root
```

保持默认主题，还是默认好看。

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

```shell
pip install opencv-contrib-python
```

### Anaconda

```shell
wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
```

```shell
sh Anaconda3-2022.05-Linux-x86_64.sh
```

```shell
/opt/anaconda3
```

```shell
conda init fish
```

原则上根发行版永远不要更新，新建虚拟环境。

虽然有 arm64 的，但官方暂时不支持树莓派。

## 基础软件

```shell
apt install -y vim net-tools wget ffmpeg htop
```

```
snap install --edge ffmpeg
```

## Docker

[安装 Docker](../../tools/ubuntu/docker.md)

## 花生壳内网穿透

[Linux 系统花生壳内网穿透](../../tools/oray.md)

## 磁盘绑定挂载

[树莓派读写移动硬盘](../../quickstart/hhd.md)

## Golang

### 官方源安装

```shell
apt install golang-go
```

### 从 snap 安装

> 自动更新

```shell
snap install go --classic
```

### Go 模块代理

```shell
go env -w GOPROXY=https://goproxy.cn,direct
go env -w GOSUMDB=off
go env -w GO111MODULE=on
```

## 关闭 swap

```shell
swapoff -a
```

```shell
vi /etc/fstab
# 注释掉 swap 挂载命令
```

## 通过 VS Code Remote SSH

复制配置文件：

- Fish
- OneDrive

## OneDrive

[安装第三方 OneDrive](../../tools/ubuntu/onedrive.md)

## 重启任务

```bash
crontab -e
```

```bash

```
