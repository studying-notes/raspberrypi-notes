---
date: 2022-05-11T19:31:53+08:00
author: "Rustle Karl"

title: "OpenWrt 系统安装与配置"
url:  "posts/raspberrypi/docs/openwrt/install"  # 永久链接
tags: [ "Raspberrypi" ]
categories: [ "Raspberrypi 学习笔记" ]

toc: true  # 目录
draft: false  # 草稿
---

## 系统下载地址

https://openwrt.cc/releases/targets/bcm27xx/bcm2711/

下载文件名包含 ext4-factory 或 squashfs-factory 的文件，例如 openwrt-bcm27xx-bcm2711-rpi-4-ext4-factory.img.gz。

squashfs 重置系统更方便(**专门坑小白的，用了就等着重裝吧**)，ext4 固件扩充容量更简单，这个是唯一选项，除非不想折腾。

### 文件格式区别

固件文件名中带有 ext4 字样的文件为搭载 ext4 文件系统固件，ext4 格式的固件更适合熟悉 Linux 系统的用户使用，在 Linux 下可以比较方便地调整 ext4 分区的大小；

固件文件名中带有 squashfs 字样的文件为搭载 squashfs 文件系统固件，而 squashfs 格式的固件适用于 “不折腾” 的用户，其优点是可以比较方便地进行系统还原，哪怕你一不小心玩坏固件，只要还能进入控制面板或 SSH，就可以很方便地进行 “系统还原操作”。

固件文件名中带有 factory 字样的文件为全新安装 OpenWrt 所用的固件，推荐在全新安装 OpenWrt 时解压 gz 文件刷入 SD 卡或硬盘。

固件文件名中带有 sysupgrade 字样的文件为升级 OpenWrt 所用的固件，无需解压 gz 文件，可直接在 Luci 面板中升级。

## 根系统分区扩容

gparted

https://mlapp.cn/1011.html

必须卸载该存储卡所有分区，然后操作。

利用树莓派官方系统烧录工具写入 SD 卡。

打开电源启动。

## 连接树莓派

选择一种连接树莓派的方式：

- 断开树莓派的有线连接，电脑连接树莓派建立的无密码热点：OpenWrt
- 断开电脑的无线连接，用网线接入树莓派

路由器默认 IP 是 192.168.1.1，用户为 root，密码为 password。

如果操作中出现问题导致无法继续配置，请重新刷入固件。

## 修改 WIFI 密码

为了防止别人连上，先修改 WIFI 密码。

- 点击「网络 -> 无线 -> 修改」
- 点击「基本设置」，在「ESSID」填入 WIFI 名称
- 点击「无线安全」，在「密码」填入新密码
- 点击「保存&应用」

## 更改 LAN 口参数

用浏览器访问 http://192.168.1.1/，用户名为 root，密码为 password，手动设置，点击「网络 -> 接口 -> LAN -> 修改」。

更改 LAN 口IP，比如路由器管理界面地址为：

```
192.168.0.1
```

接下来要把树莓派的 IP 改为与路由器同一网段，即 192.168.0.x（`0<x<255`）。

这里我把树莓派 LAN 口 IP 设置为：

```
192.168.0.16
```

更改 IP 后请记好，以后管理界面都在 192.168.0.16。

全部参数：

- 协议：静态地址
- IPV4 地址：192.168.0.16
- IPv4 子网掩码: 255.255.255.0
- IPv4 网关：改为上级路由器管理界面 IP：192.168.0.1
- Pv4 广播：把上级路由网段 IP 最后一段改为 255： 192.168.0.255
- 使用自定义的 DNS 服务器：同样为上级路由器 IP：192.168.0.1
- 忽略此接口/不在此接口提供 DHCP 服务 （在页面底部）：打勾

点击「保存&应用」。设置好后重新连接树莓派网络。

## 连接路由器

断开电脑与树莓派的连接，用网线将树莓派接到路由器 LAN 口。

## 作为旁路由

### 客户端设置

连接主路由的设备需要进行以下设置：

- IP 获取方式改为 「静态（或手动）」
- IP 地址：填为路由器网段下任意不冲突的 IP
- 前缀长度/子网掩码：若提示填写前缀长度，则填写 24，若提示填写子网掩码，则填写 255.255.255.0
- DNS：填写为树莓派 LAN 口 IP：192.168.0.16
- 网关/路由器：填写为树莓派 LAN 口 IP：192.168.0.16
- 其他设置保持默认即可

## SSH 上传公钥

```shell
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.0.16
```

## 修改主机名

系统 -> 系统 -> 主机名

可以直接在 Web 管理页修改，不用重启。

## OpenClash 配置

[OpenClash 问题与配置](../../tools/openwrt/openclash.md)

## 包管理器命令

```shell
# Fetch a list of available packages from the OpenWrt package repository.
opkg update

#	Display a list of available packages and their descriptions.
opkg list

# Filter the list by a search term in the package name or its description.
opkg list | grep -e <search>

opkg install <packages>
opkg remove <packages>
```

## Fish  Shell

```shell
opkg install fish shadow-chsh
```

```shell
chsh -s /usr/bin/fish
```

Fish 配置见 Linux/PS 笔记。

## 常用软件

### Git & SSH

```shell
opkg install git-http openssh-keygen openssh-client openssh-sftp-server
```

缺一个 Git 都不能正常。

### Docker

```shell
opkg install --force-overwrite docker docker-compose dockerd luci-app-docker luci-app-dockerman luci-i18n-dockerman-zh-cn luci-lib-docker luci-i18n-docker-zh-cn fuse-overlayfs
```

千万别手动启动，必须在管理界面开启，否则配置都不生效。

```shell
killall /usr/bin/dockerd
```

### Python

```shell
opkg install python3 python3-pip
```

### Golang

```shell
opkg install golang
```

编译时出现 `cannot find -lpthread`，执行下面的命令：

```shell
ar -rc /usr/lib/libpthread.a
```

### Nginx

```shell
opkg install nginx
```

### GCC

```shell
opkg install make pkg-config gcc libncurses-dev
```

### 网络资源查看

```shell
opkg install iftop
```

### Syncthing

[syncthing 同步备份数据](../../tools/openwrt/syncthing.md)

### VS Code SSH 远程

[VSCode SSH 远程功能](question.md)

## 迁移旧文件

password

```shell
scp -rv 'root@192.168.0.10:/root/.config' '/root'
```

```shell
scp -v 'root@192.168.0.10:/root/.gitconfig' '/root/.gitconfig'
```

```shell
scp -rv 'root@192.168.0.10:/root/.ssh' '/root'
```

```shell
scp -rv 'root@192.168.0.10:/root/.ssh/known_hosts' '/root/.ssh/known_hosts'
```

```shell
scp -rv 'root@192.168.0.10:/root/projects' '/root'
```

```shell
scp -rv 'root@192.168.0.10:/etc/init.d/*' '/etc/init.d/'
```

------------------------------------------------------------------------------

## 修改硬盘挂载

Web 管理界面 - 系统 - 挂载点/磁盘管理 进行设置。

## 临时关闭防火墙

不少软件会自动打开防火墙。

```shell
/etc/init.d/firewall disable && /etc/init.d/firewall stop
```
