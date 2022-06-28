---
date: 2021-01-01T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "Raspberry Pi OS 系统安装与基本配置"
url:  "posts/raspberrypi/docs/raspberrypios/install"
tags: [ "raspberrypi", "config"]
categories: [ "Raspberrypi 学习笔记" ]

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

- [将系统刻录进 U 盘](#将系统刻录进-u-盘)
- [默认用户和密码](#默认用户和密码)
- [开启 SSH 服务](#开启-ssh-服务)
  - [开机自启](#开机自启)
  - [启用 root 登录](#启用-root-登录)
  - [设置主机名](#设置主机名)
  - [上传免密公钥](#上传免密公钥)
  - [不显示登录标语](#不显示登录标语)
- [开启 VNC 服务](#开启-vnc-服务)
  - [无显示器 VNC](#无显示器-vnc)
    - [无法显示桌面问题](#无法显示桌面问题)
- [换源](#换源)
  - [添加信任](#添加信任)
- [设置常用别名](#设置常用别名)
- [设置 Python](#设置-python)
- [时间同步](#时间同步)
- [关闭指示灯](#关闭指示灯)
  - [永久关闭](#永久关闭)

## 将系统刻录进 U 盘

https://www.raspberrypi.org/software/

从官网下载系统镜像和刻录软件即可。

## 默认用户和密码

```ini
pi@raspberry
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

### 设置主机名

```shell
echo master > /etc/hostname
```

### 上传免密公钥

```shell
ssh-copy-id -i ~/.ssh/id_rsa.pub root@master
ssh-copy-id -i ~/.ssh/id_rsa.pub root@raspberrypi
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.4.171
```

### 不显示登录标语

```shell
touch ~/.hushlogin
```

## 开启 VNC 服务

```shell
raspi-config
```

### 无显示器 VNC

```shell
vncserver :1 -geometry 1920x1080
```

```
New desktop is raspberrypi:1 (master:1)
```

然后在 VNC Viewer 的地址栏里输入 `master:1` 进行连接即可。

#### 无法显示桌面问题

> Cannot currently show the desktop

```shell
raspi-config
```

Display Options -> Resolution

设置成最大分辨率

```shell
reboot
```

## 换源

```shell
pip install -U toolkit-py -i https://pypi.douban.com/simple
```

```shell
cfm pi
```

非官方源在安装某些软件时会有问题，比如 CMake、Snap，所以现在宁可慢点，也不换源了。

### 添加信任

```shell
gpg --keyserver  keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
gpg --export --armor  648ACFD622F3D138 | sudo apt-key add -
```

```shell
apt update && apt upgrade -y
```

## 设置常用别名

```shell
ccf alias -w
```

## 设置 Python

已经自带 Python2 和 Python3，之前默认是 Python2，最新版已经是默认 Python3.9 了。

```shell
cp /usr/bin/python /usr/bin/python2
cp /usr/bin/pip /usr/bin/pip2
```

```shell
rm /usr/bin/python
rm /usr/bin/pip

ln -s /usr/bin/python3 /usr/bin/python
ln -s /usr/bin/pip3 /usr/bin/pip
```

```shell
pip install -U toolkit-py -i https://pypi.douban.com/simple # 个人工具包
```

## 时间同步

```shell
apt install ntpdate -y
```

```shell
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && ntpdate time2.aliyun.com
```

## 关闭指示灯

```shell
echo 0 | tee  /sys/class/leds/led0/brightness
echo none | tee  /sys/class/leds/led0/trigger
echo none | tee  /sys/class/leds/led1/trigger
echo 0 | tee /sys/class/leds/led1/brightness
```

### 永久关闭

/boot/config.txt

```
act_led_trigger         Choose which activity the LED tracks.
                        Use "heartbeat" for a nice load indicator.
                        (default "mmc")
act_led_activelow       Set to "on" to invert the sense of the LED
                        (default "off")
                        N.B. For Pi 3B, 3B+, 3A+ and 4B, use the act-led
                        overlay.
act_led_gpio            Set which GPIO to use for the activity LED
                        (in case you want to connect it to an external
                        device)
                        (default "16" on a non-Plus board, "47" on a
                        Plus or Pi 2)
                        N.B. For Pi 3B, 3B+, 3A+ and 4B, use the act-led
                        overlay
pwr_led_trigger
pwr_led_activelow
pwr_led_gpio
                        As for act_led_*, but using the PWR LED.
                        Not available on Model A/B boards.
```

即可以通过关闭 act_led_trigger 和 pwr_led_trigger 追踪的方式来关闭树莓派上的指示灯

在 /boot/config.txt 文件中添加以下命令即可：

```
dtparam=act_led_trigger=none
dtparam=pwr_led_trigger=none
```

树莓派的网络指示灯也可以进行自定义配置：

```
eth_led0                Set mode of LED0 (usually orange) (default
                        "1"). The legal values are:
                        0=link/activity          1=link1000/activity
                        2=link100/activity       3=link10/activity
                        4=link100/1000/activity  5=link10/1000/activity
                        6=link10/100/activity    14=off    15=on
eth_led1                Set mode of LED1 (usually green) (default
                        "6"). See eth_led0 for legal values.
```
