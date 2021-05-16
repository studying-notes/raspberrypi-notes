Load 过高但是 CPU 占用率低，可以是 IO 过高。

vmstat 2 5

bi 和 bo 这一项，显示的就是服务器读写磁盘的情况。

apt install -y iotop

iotop

tid 就是 pid
