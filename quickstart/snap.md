
## 安装 Snap Store

```shell
apt install -y snapd
```

```shell
systemctl daemon-reload
systemctl restart snapd
```

```shell
snap install snap-store
```

snap changes
sudo snap abort 4
snap refresh package

fuser -v /var/cache/debconf/config.dat

snap set system proxy.http="http://slave:7890"
snap set system proxy.https="http://slave:7890"

snap set system proxy.http="http://slave:7890"
snap set system proxy.https="http://slave:7890"

snap set system proxy.http="http://192.168.199.140:8118"
snap set system proxy.https="http://192.168.199.140:8118"

snap set system proxy.http="http://192.168.199.140:7890"
snap set system proxy.https="http://192.168.199.140:7890"

snap set system proxy.http="socks5://localhost:10808"
snap set system proxy.https="socks5://localhost:10808"

snap unset system proxy.http
snap unset system proxy.https
