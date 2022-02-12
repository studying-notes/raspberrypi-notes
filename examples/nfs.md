---
date: 2022-02-13T00:07:56+08:00
author: "Rustle Karl"

title: "NFS 文件系统安装与部署"
url:  "posts/raspberrypi/examples/nfs"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## 安装软件

```shell
apt install -y nfs-kernel-server nfs-common rpcbind
```

## 编辑配置文件

```shell
echo '
/mnt/sda       192.168.0.0/24(rw,no_root_squash,insecure,no_subtree_check,async)
/mnt/sdb       192.168.0.0/24(rw,no_root_squash,insecure,no_subtree_check,async)
/mnt/sdc       192.168.0.0/24(rw,no_root_squash,insecure,no_subtree_check,async)
' > /etc/exports
```

## 刷新重启

```shell
exportfs -rv
systemctl restart nfs-kernel-server
```

## 显示可用路径

```shell
showmount -e master
```

## 重启自动加载

```shell
vim /etc/fstab
```

```
master:/mnt/sda  /mnt/sda       nfs    defaults 0 0
```

```shell
mount -a
```

```shell
df -Th
```

## Windows

CMD 命令行挂载到 N 盘：

```shell
mount -o nolock \\master\mnt\a L:\
```

```shell
umount L:\
```

打开注册表

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default

新建两个 OWORD（64）位值，添加值

- AnonymousGid 值默认为 0
- AnonymousUid 值默认为 0

重启生效
