---
date: 2022-09-11T13:02:19+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "frp 内网穿透客户端配置教程"  # 文章标题
url:  "posts/raspberrypi/tools/frp/README"  # 设置网页永久链接
tags: ["Raspberrypi 学习笔记"]

toc: true # 目录
draft: false # 草稿
---

下载安装部分见 [frp 内网穿透服务端配置教程](https://github.com/studying-notes/aws-notes/tree/main/tools/frp)。

## 修改配置

```bash
apt install -y micro
```

```bash
micro frpc.ini
```

```bash
[common] 
server_addr = 服务器ip
server_port = 7000 
token = 52010 

[ssh] 
type = tcp 
local_ip = 127.0.0.1 
local_port = 22 
remote_port = 6000 

[web] 
type = http 
local_ip = 127.0.0.1 
local_port = 8080 
remote_port = 8080
```

## 复制文件

```bash
sudo mkdir -p /etc/frp
sudo cp frpc.ini /etc/frp
sudo cp frpc /usr/bin
```

## 创建服务

```bash
micro frpc.service
```

```bash
[Unit]
Description=Frp Client Service
After=network.target

[Service]
Type=simple
User=nobody
Restart=on-failure
RestartSec=5s
ExecStart=/usr/bin/frpc -c /etc/frp/frpc.ini
ExecReload=/usr/bin/frpc reload -c /etc/frp/frpc.ini
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
```

## 启动服务

```bash
sudo cp frpc.service /usr/lib/systemd/system/
sudo systemctl enable frpc
sudo systemctl start frpc
```
