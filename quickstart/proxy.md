```shell
git config --global --unset http.https://github.com.proxy
git config --global http.https://github.com.proxy http://192.168.199.140:8118

git config --global http.https://github.com.proxy socks://localhost:10808
```

## v2ray

wget http://ubuntu/mirror/scripts/v2ray_install_release.sh

bash <(curl -L http://ubuntu/mirror/scripts/v2ray_install_release.sh)

```shell
mkdir -p /etc/v2ray && cp /mnt/extra/mirror/configs/v2ray_config.json /usr/local/etc/v2ray/config.json
```

systemctl enable v2ray

systemctl restart v2ray; systemctl status v2ray

systemctl restart v2ray

systemctl stop v2ray

systemctl disable v2ray

# 设置及修改配置

apt install -y proxychains4

apt remove -y proxychains4

cp /mnt/extra/mirror/configs/proxychains.conf /etc/proxychains.conf

vim /etc/proxychains.conf

10808

返回未代理前的本地公网地址

curl ip.sb

返回代理过服务器地址，表示搭建成功，若长时间无响应或返回非服务端 IP 地址的内容则表示搭建失败

proxychains4 curl ip.sb

proxychains4 curl google.com


## Clash

go install github.com/Dreamacro/clash@latest

clash -v

cp  /mnt/extra/mirror/configs/clash_config.yaml ~/clash_config.yaml

/root/go/bin/clash -f ~/clash_config.yaml &

/root/go/bin/clash -f /mnt/extra/mirror/configs/clash_config.yaml &

nohup /root/go/bin/clash -f /mnt/extra/mirror/configs/clash_config.yaml > ~/clash.log 2>&1 & echo "$!" > clash.pid

ps ax | grep /root/go/bin/clash


 /root/go/bin/clash
 /root/go/bin/hugo

ln -s /root/go/bin/clash /usr/bin/clash
ln -s /root/go/bin/hugo /usr/bin/hugo

curl --socks5 localhost:7891 http://google.com/
curl -x localhost:7890 http://google.com/
