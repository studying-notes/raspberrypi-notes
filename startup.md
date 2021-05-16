## ubuntu 20.04.1 LTS 开机自启动脚本服务开启

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

/usr/bin/python /projects/comic-scrapy/internal/resource.py &

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


```shell

```


```shell

```



