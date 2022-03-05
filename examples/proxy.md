---
date: 2022-03-05T21:32:30+08:00
author: "Rustle Karl"

title: "代理相关的软件和配置"
url:  "posts/raspberrypi/examples/proxy"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## Curl 测试代理

```shell
curl --socks5 localhost:7891 http://google.com/
```

```shell
curl -x localhost:7890 http://google.com/
```

```shell
curl -x localhost:7890 http://baidu.com/
```

## Git 代理

```shell
git config --global http.https://github.com.proxy http://192.168.199.140:8118
git config --global http.https://github.com.proxy socks://localhost:10808
```

### 取消代理

```shell
git config --global --unset http.https://github.com.proxy
```

## v2ray

```shell
wget http://ubuntu/mirror/scripts/v2ray_install_release.sh
```

```shell
bash <(curl -L http://ubuntu/mirror/scripts/v2ray_install_release.sh)
```

```shell
mkdir -p /etc/v2ray && cp /mnt/extra/mirror/configs/v2ray_config.json /usr/local/etc/v2ray/config.json
```

```shell
systemctl enable v2ray
```

```shell
systemctl restart v2ray; systemctl status v2ray
```

```shell
systemctl restart v2ray
```

```shell
systemctl stop v2ray
```

```shell
systemctl disable v2ray
```

## 用 proxychains4 测试

```shell
apt install -y proxychains4
```

```shell
apt remove -y proxychains4
```

```shell
cp /mnt/sdb/mirror/configs/proxychains.conf /etc/proxychains.conf
```

```shell
vim /etc/proxychains.conf
```

**返回未代理前的本地公网地址**

```shell
curl ip.sb
```

返回代理过服务器地址，表示搭建成功，若长时间无响应或返回非服务端 IP 地址的内容则表示搭建失败

```shell
proxychains4 curl ip.sb
```

```shell
proxychains4 curl google.com
```

## Clash

```shell
go install github.com/Dreamacro/clash@latest
```

```shell
ln -s /root/go/bin/clash /usr/bin/clash
```

```shell
clash -v
```

```shell
setsid clash -f clash_config.yaml > ~/clash.log 2>&1 & echo "$!" > clash.pid
```
