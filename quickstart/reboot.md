---
date: 2022-03-16T22:39:22+08:00
author: "Rustle Karl"

title: "设置开机自启动脚本"
url:  "posts/raspberrypi/quickstart/reboot"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

### 创建 rc-local.service 文件

vi /etc/systemd/system/rc-local.service

```shell
echo '
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/rc-local.service
```

vi /etc/rc.local

```shell
echo '#!/bin/sh -e
## rc.local

# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
# In order to enable or disable this script just change the execution  bits.
# By default this script does nothing.

#start script

/bin/bash ~/projects/scripts/restart.sh &

#end script
exit 0
' > /etc/rc.local
```

```shell
chmod +x /etc/rc.local
```

```shell
systemctl enable rc-local
```

```shell
systemctl start rc-local.service
systemctl restart rc-local.service
systemctl stop rc-local.service
systemctl status rc-local.service
```
