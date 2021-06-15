---
date: 2021-01-01T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派安装与基本配置"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/config"  # 设置网页永久链接
tags: [ "raspberrypi", "config"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## hosts

```shell
echo '
192.168.199.101 slave
192.168.199.105 ubuntu
' >> /etc/hosts
```

```shell
sysctl --system  #生效
```

## 将系统刻录进 U 盘

https://www.raspberrypi.org/software/

从官网下载系统镜像和刻录软件即可。

## 默认用户和密码

```ini
pi
```

```ini
raspberry
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
pi
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

### 上传免密公钥

```shell
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.199.208
```

```shell
ssh-copy-id -i ~/.ssh/id_rsa.pub root@slave
ssh-copy-id -i ~/.ssh/id_rsa.pub root@ubuntu
```

```shell
ssh root@192.168.199.208
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
New desktop is raspberrypi:1 (192.168.199.208:1)
```

然后在 VNC Viewer 的地址栏里输入 `192.168.199.208:1` 进行连接即可。

### 开机自启

不建议了。

#### Cannot currently show the desktop


```shell
raspi-config
```

Display Options -> Resolution

设置成最大分辨率

```shell
reboot
```

```shell

```




## 换源

```shell
echo -e 'deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi\ndeb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi' > /etc/apt/sources.list
```

```shell
echo 'deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui' > /etc/apt/sources.list.d/raspi.list
```

```shell
rm /var/lib/apt/lists/lock
```

```shell
apt-get update && apt-get upgrade -y
```

## 设置常用别名

```shell
./alias.sh
```

```shell
source ~/.profile
```

```shell
apt install -y chromium-browser
```

## 安装 Python

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
pip3 install toolkit-py # 个人工具包
pip3 install toolkit-py # 个人工具包
```

```shell
chs # 换源
```

树莓派的配置文件是 `/etc/pip.conf`

```shell
cat ~/.pip/pip.conf > /etc/pip.conf
```

```shell
pip3 install --upgrade --force jupyter-console
```

```shell
python3 -m pip install -U opencv-python
```


```shell
python3 -m pip install -U jupyterlab
```

```shell
python3 -m IPython
```

```shell
from notebook.auth import passwd
passwd()
```

```shell
jupyter lab --generate-config
```

/root/.jupyter/jupyter_lab_config.py

```shell
# 免密
c.ServerApp.token = ''
```

```shell
jupyter lab --allow-root
```



```shell
nohup jupyter lab --allow-root > jupyter.log 2>&1 &
```

## 时间同步

```shell
apt install ntpdate -y
```



```shell
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && ntpdate time2.aliyun.com
```

```shell

```

## 关闭指示灯

```shell
echo 0 | sudo tee  /sys/class/leds/led0/brightness
echo none | sudo tee  /sys/class/leds/led0/trigger
echo none | sudo tee  /sys/class/leds/led1/trigger
echo 0 | sudo tee /sys/class/leds/led1/brightness
```

```shell

```
```shell

```

