## 下载项目

```shell
git config --global --unset http.https://github.com.proxy
git config --global http.https://github.com.proxy http://192.168.199.140:8118
git config --global http.https://github.com.proxy http://slave:7890
```

git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules

cd chia-blockchain

sh install.sh

ssh root@slave

ssh root@ubuntu

ln -s  /mnt/extra/chia/mainnet /root/.chia/mainnet

. ./activate

deactivate

cd ~/chia-blockchain && . ./activate && chia show -s

cd /mnt/extra/chia/chia-blockchain

cd /mnt/extra/chia/chia-blockchain && . ./activate && chia show -s

## 添加密钥

chia keys show --show-mnemonic-seed

chia keys add

filter deer party grape silver away safe select draw crack candy syrup vanish evolve person cover offer eye swift render inmate derive penalty beauty

## 启动 Chia

chia start farmer

chia start farmer -r

chia stop farmer

chia stop farmer && chia start farmer

chia start wallet

chia wallet show


## 是否同步

chia show -s

## 添加图

chia plots add -d '/mnt/extra/plots'
chia plots add -d '/mnt/plots/plots'
chia plots add -d '/mnt/plots2/plots'
chia plots add -d '/mnt/plots3/plots'

chia plots remove -d /mnt/plots/raspberry
chia plots remove -d /mnt/plots/windows

chia plots check

chia plots show

## 创建图

nohup chia plots create -n 1 -k 32 -b 2000 -t /mnt/netac -d /mnt/plots/raspberry >> /mnt/plots/raspberry_plots.log 2>&1 &

nohup chia plots create -n 1 -k 32 -b 3000 -t /mnt/plots/chia -d /mnt/plots/raspberry >> /mnt/plots/plots_8.log 2>&1 &

tail -f /mnt/plots/raspberry_plots.log

## 读写速度

apt install iotop

iotop
