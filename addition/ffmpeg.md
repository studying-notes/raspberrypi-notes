apt install snapd

reboot

snap set system proxy.http="http://192.168.199.140:7890"
snap set system proxy.https="http://192.168.199.140:7890"

snap install ffmpeg --classic
snap install --edge ffmpeg

snap set system proxy.http="http://192.168.10.138:8118"
snap set system proxy.https="http://192.168.10.138:8118"
