---
date: 2022-06-28T16:14:26+08:00
author: "Rustle Karl"

title: "Ubuntu for Respberrypi 问题记录"
url:  "posts/respberrypi/docs/ubuntu/question"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
categories: [ "Raspberrypi 学习笔记" ]

toc: true  # 目录
draft: false  # 草稿
---

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

### 静态路由

```yaml
network:
    version: 2
    renderer: networkd
    ethernets:
        eth0:
            addresses:
                - 192.168.0.14/24
            nameservers:
                addresses: [192.168.0.16]
            routes:
                - to: default
                  via: 192.168.0.16
```

## 默认用户名与密码

```
ubuntu@ubuntu
```

## 首次登录无法改密码

好久不搞了，今天重装系统，居然发现登录后无法改密码。

```
passwd: Authentication token manipulation error
```

`user-data`

```
chpasswd:
  expire: false
  list:
  - ubuntu:ubuntu
```

## 二级

### 三级

```shell

```

```shell

```


## 二级

### 三级

```shell

```

```shell

```


## 二级

### 三级

```shell

```

```shell

```


## 二级

### 三级

```shell

```

```shell

```


## 二级

### 三级

```shell

```

```shell

```


