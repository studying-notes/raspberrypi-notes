---
date: 2021-01-01T09:38:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "树莓派 Ubuntu 系统安装 Selenium 和 Chrome 浏览器"  # 文章标题
# description: "文章描述"
url:  "posts/raspberrypi/selenium"  # 设置网页永久链接
tags: [ "raspberrypi", "selenium"]  # 标签
series: [ "树莓派学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 安装 Snap Store

```shell
apt install -y snapd
```

```shell
snap set system proxy.http="http://192.168.199.140:8118"
snap set system proxy.https="http://192.168.199.140:8118"
```

```shell
systemctl daemon-reload
systemctl restart snapd
```

```shell
snap install snap-store
```

## 安装 chromium

```shell
snap install --edge chromium
```

```shell
snap refresh --edge chromium
```

```shell
snap remove chromium
```

## 安装 chromium-browser

```shell
apt install -y chromium-browser chromium-chromedriver
```

```shell
chromium-browser --version
```

```shell
chromedriver --version
```

```shell
apt -y install xvfb
```

```shell
pip3 install pyvirtualdisplay
```

```python
from pyvirtualdisplay import Display

display = Display(visible=0, size=(800, 600))
display.start()
```

```shell
apt --fix-broken install -y
dpkg --configure -a
apt purge --remove chromium-browser -y
apt autoremove && sudo apt autoclean -y
apt install chromium-chromedriver -y
```

```shell

```

```shell
apt install -y xdg-utils
```

```shell
xdg-settings set default-web-browser chromium-browser.desktop
```

```shell
xdg-settings get default-web-browser
```
