
## 实时性能和运行状况监视

官方提供一键安装程序，使用于任何 Linux 系统，包括树莓派上：

```shell
cat kickstart.sh | bash
```

访问即可：

http://192.168.199.209:19999

### 监控 CPU 温度

```shell
bash /etc/netdata/edit-config charts.d.conf
```

添加这行代码：

```shell
sensors=force
```

```shell
systemctl restart netdata
```

### 常用命令

#### 停止

```shell
systemctl stop netdata 
```
#### 启动

```shell
systemctl start netdata 
```

#### 重启

```shell
systemctl restart netdata 
```

#### 开机启动 
```shell
systemctl enable netdata
```

#### 卸载

```shell
sudo bash /usr/libexec/netdata-uninstaller.sh
```
