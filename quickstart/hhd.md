---
date: 2021-01-01T23:17:00+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派读写移动硬盘"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/quickstart/hhd"  # 设置网页永久链接
tags: [ "raspberrypi", "hhd"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 挂载硬盘

```shell
apt install -y exfat-fuse exfat-utils
```

树莓派关机状态下插入移动硬盘，开机。

### 格式化硬盘

1. 查询硬盘信息

```shell
lsblk
```

找到需要挂载的硬盘。

```shell
/dev/sda
```

2. 格式化硬盘

```shell
mkfs -t ext4 /dev/sda

# openwrt
mkfs.ext4 /dev/sda
```

### 挂载目录

1. 创建硬盘挂载目录

```shell
mkdir /mnt/sda  /mnt/sdb  /mnt/sdc
umount /mnt/sda  /mnt/sdb  /mnt/sdc
rm -rf /mnt/sda  /mnt/sdb  /mnt/sdc
```

2. 挂载硬盘

```shell
mount /dev/sda /mnt/sda

# exfat 格式
mount -t exfat /dev/sdb /mnt/sdb
```

再次查询：

```shell
df -h -T
```

```bash
dd if=/dev/zero of=test bs=10M count=200
```

### 硬盘权限

```shell
chmod 777 /mnt/sda
```

### 开机自动挂载

1. 找到硬盘的UUID

```shell
blkid
```

2. 执行这个命令

```shell
vim /etc/fstab
```

1. 按照格式添加

```shell
# ext4 格式
UUID=c957486a-bc06-4ef6-b689-664cc1f20a10    /mnt/sda     ext4    defaults    0   0
UUID=9d53a72a-7324-4cb4-89d2-1c9b02af429c    /mnt/ubuntu.old     ext4    defaults    0   0
UUID=BCD2E5DDD2E59BC0    /mnt/windows.backup     ntfs    defaults    0   0

# exfat 格式
UUID=E845-FADE    /mnt/sdb     exfat    defaults    0   0
```

4. 测试一下是否有问题

```shell
mount -a
```

无反应，则代表正常。

## 迁移文件

```shell
cd /mnt/sda && mkdir dockerd docker mirror merls root

cp -r /root /mnt/sda/root

rm -rf /root

# 这样搞 snap 直接罢工，无语啊，无解，只能放弃使用 snap
ln -s /mnt/sda/root /root

ln -s /mnt/sda/dockerd /var/lib/docker
```

### 通过 mount 挂载另一个分区来扩展可用存储空间

> 需复制原文件夹的内容到新硬盘，挂载了整个硬盘，感觉不太好

```shell
mkfs.ext4 /dev/sdc
```

```shell
mv work-dir/* old-dir
```

```shell
mount -t ext4 /dev/sdx work-dir
```

```shell
alias cp="rsync -ah --progress"
```

```shell
cp -a old-dir/* work-dir
```

mount --bind /mnt/d/OneDrive/Repositories/projects /projects

## Windows 下硬盘格式化方法

在 Windows 下使用最新的 Diskgenus 软件分区，文件系统格式选择 ext4。
