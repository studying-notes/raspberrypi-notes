---
date: 2021-01-02T09:22:54+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派设置简单 FTP Server"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/ftp"  # 设置网页永久链接
tags: [ "raspberrypi", "ftp"]  # 标签
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
apt-get install -y vsftpd
```

## 配置文件

编辑 `/etc/vsftpd.conf` 文件：

```shell
mv /etc/vsftpd.conf /etc/vsftpd.conf.backup
```

```shell
echo '
listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
local_umask=022
dirmessage_enable=YES
xferlog_enable=YES
use_localtime=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO

utf8_filesystem=YES
write_enable=YES
local_root=/mnt/extra
allow_writeable_chroot=YES
max_per_ip=50000
force_dot_files=YES
' > /etc/vsftpd.conf
```

```
用户名 pi
密码 root
```

## 允许 root 用户

```shell
vim /etc/ftpusers
```

删掉 root 即可

## 设置 FTP 目录

```shell
mkdir -p /mnt/storage/vsftp
```

```shell
chmod 777 /mnt/storage/vsftp
```

```shell
service vsftpd restart
```

```shell

```

```shell

```