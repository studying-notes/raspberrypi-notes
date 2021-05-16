---
date: 2021-01-01T23:17:00+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派读写移动硬盘"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/hhd"  # 设置网页永久链接
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

树莓派关机状态下插入移动硬盘，开机。

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
mkfs -t ext4 /dev/sdb
mkfs -t ext4 /dev/sdc
```

3. 创建硬盘挂载目录

```shell
mkdir /mnt/storage  /mnt/extra

mkdir /mnt/plots
mkdir /mnt/nfs

mkdir /mnt/netac
```

4. 挂载硬盘

```shell
mount /dev/sdb /mnt/extra

mount /dev/sda /mnt/plots
mount /dev/sda /mnt/netac
```

```shell
mount /dev/sdc1 /mnt/storage
mount /dev/sda /mnt/extra
```

再次查询：

```shell
df -h -T
```

### 硬盘权限

```shell
chmod 777 /mnt/storage
chmod 777 /mnt/extra
chmod 777 /mnt/nfs
chmod 777 /mnt/plots
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
UUID=c01ca4d1-2582-45cf-b523-74fca287f7d2    /mnt/storage     ext4    defaults    0   0
UUID=565a23d5-17d8-49e4-af86-2fa184d56c81    /mnt/extra     ext4    defaults    0   0
UUID=84db985a-5aa8-429f-b5ec-539e4d5e5fcb    /mnt/nfs     ext4    defaults    0   0
UUID=5e082e90-8d08-4884-99df-b671334fa83f    /mnt/netac     ext4    defaults    0   0
```

4. 测试一下是否有问题

```shell
mount -a
```

无反应，则代表正常。

## 迁移文件

```shell
mkdir docker comics mirror merls repositories developer
```

```shell
cp /mnt/storage/service/* /mnt/extra/docker/
cp /mnt/storage/system/docker/* /mnt/extra/docker/dockerd
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
