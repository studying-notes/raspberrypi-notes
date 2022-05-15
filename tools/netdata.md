---
date: 2022-03-17T19:01:09+08:00
author: "Rustle Karl"

title: "Netdata 实时监视性能和运行状况"
url:  "posts/raspberrypi/tools/netdata"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## 实时性能和运行状况监视

官方提供一键安装程序，使用于任何 Linux 系统，包括树莓派上：

```shell
wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh
```

访问即可：

http://ubuntu-amd64:19999

### 监控 CPU 温度

```shell
bash /etc/netdata/edit-config charts.d.conf
```

添加这行代码：

```shell
sensors=force
```

```shell
systemctl restart netdata
```

### 常用命令

#### 停止

```shell
systemctl stop netdata
```
#### 启动

```shell
systemctl start netdata
```

#### 重启

```shell
systemctl restart netdata
```

#### 开机启动
```shell
systemctl enable netdata
```

#### 卸载

```shell
wget https://raw.githubusercontent.com/netdata/netdata/master/packaging/installer/netdata-uninstaller.sh

chmod +x ./netdata-uninstaller.sh

./netdata-uninstaller.sh --yes
```
