## NFS 文件系统

> 比 FTP 好千万倍！

```shell
apt install -y nfs-kernel-server nfs-common rpcbind
```

/etc/default/nfs-kernel-server
/etc/default/nfs-common
/etc/exports

```shell
echo '
/mnt       192.168.199.0/24(rw,no_root_squash,fsid=0,insecure,no_subtree_check,async)
/mnt/extra       192.168.199.0/24(rw,no_root_squash,insecure,no_subtree_check,async)
/mnt/plots       192.168.199.0/24(rw,no_root_squash,insecure,no_subtree_check,async)
' > /etc/exports
```

```shell
systemctl restart nfs-kernel-server
```

```shell
showmount -e ubuntu
```

```shell
vim /etc/fstab
```

```
ubuntu:/mnt/extra  /mnt/extra       nfs    defaults 0 0
```

```shell
mount -a
```

```shell
df -Th
```

### Windows

CMD 命令行挂载到 N 盘：

```shell
mount -o nolock \\ubuntu\mnt\extra N:\

mount -o nolock \\ubuntu\mnt\plots L:\
```

```shell
umount N:\
```

打开注册表

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default

新建两个 OWORD（64）位值，添加值

- AnonymousGid 值默认为 0
- AnonymousUid 值默认为 0

重启生效

```shell

```

```shell

```

```shell

```

```shell

```

```shell

```

```shell

```

```shell

```

```shell

```

```shell

```

```shell

```

