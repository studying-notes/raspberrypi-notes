---
date: 2022-03-05T21:32:30+08:00
author: "Rustle Karl"

title: "代理软件和常用工具代理设置"
url:  "posts/raspberrypi/tools/proxy"  # 永久链接
tags: [ "Raspberrypi" ]  # 标签
series: [ "Raspberrypi 学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

- [wget 代理示例](#wget-代理示例)
- [curl 代理示例](#curl-代理示例)
  - [socks5](#socks5)
  - [http](#http)
- [apt 代理示例](#apt-代理示例)
- [git 代理](#git-代理)
  - [取消代理](#取消代理)
- [Windows Cmd](#windows-cmd)
- [Linux Shell](#linux-shell)
- [v2ray](#v2ray)
- [Clash](#clash)
- [proxychains 全局代理](#proxychains-全局代理)

## wget 代理示例

```shell
wget -e use_proxy=yes -e http_proxy=127.0.0.1:8118 -e https_proxy=127.0.0.1:8118 https://github.com/JetBrains/kotlin/releases/download/v1.6.21/kotlin-compiler-1.6.21.zip
```

## curl 代理示例

### socks5

```shell
curl --socks5 localhost:7891 http://google.com/
curl --socks5 192.168.4.118:8838 http://google.com/
```

### http

```shell
curl -x localhost:7890 http://google.com/
curl -x localhost:8118 http://google.com/
```

## apt 代理示例

```shell
apt -o Acquire::http::proxy="http://192.168.4.118:8118/" update
apt -o Acquire::http::proxy="http://192.168.4.118:8118/" -y upgrade
```

```shell
alias apt='apt -o Acquire::http::proxy="http://192.168.4.118:8118/"'
alias apt='apt -o Acquire::http::proxy="http://192.168.0.117:8118/"'
```

```shell
cat > ~/apt_proxy.conf << EOF
Acquire::http::proxy "http://127.0.0.1:8000/";
Acquire::ftp::proxy "ftp://127.0.0.1:8000/";
Acquire::https::proxy "https://127.0.0.1:8000/";
EOF
```

## git 代理

```shell
cat ~/.gitconfig
```

```shell
# http
git config --global http.https://github.com.proxy http://192.168.0.117:8118
# socks
git config --global http.https://github.com.proxy socks://localhost:8838
```

### 取消代理

```shell
git config --global --unset http.https://github.com.proxy
git config --global --add github.com.proxy ""
```

## Windows Cmd

```
set HTTP_PROXY=http://localhost:8118
set HTTPS_PROXY=http://localhost:8118
```

## Linux Shell

```
export HTTP_PROXY=http://localhost:8118
export HTTPS_PROXY=http://localhost:8118
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
systemctl disable v2ray
```

```shell
systemctl restart v2ray
systemctl status v2ray
systemctl restart v2ray
systemctl stop v2ray
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

## proxychains 全局代理

```shell
apt install -y proxychains4
```

```shell
vim /etc/proxychains4.conf
```

翻到最后添加代理服务器即可

```shell
socks5   127.0.0.1 8118
```
