mkdir -p /mnt/sda/onedrive
ln -s  /mnt/sda/onedrive ~/OneDrive

mkdir -p /mnt/sda/download
ln -s  /mnt/sda/download ~/Downloads

apt install -y build-essential libcurl4-openssl-dev libsqlite3-dev pkg-config git 

cd ~/Downloads

curl -fsS https://dlang.org/install.sh | bash -s ldc

apt install -y libnotify-dev

Run `source ~/dlang/ldc-1.26.0/activate` in your shell to use ldc-1.26.0.
This will setup PATH, LIBRARY_PATH, LD_LIBRARY_PATH, DMD, DC, and PS1.
Run `deactivate` later on to restore your environment.

source ~/dlang/ldc-1.26.0/activate

git clone https://github.com/abraunegg/onedrive.git
cd onedrive
./configure DC=~/dlang/ldc-1.26.0/bin/ldmd2
make clean; make
make install

deactivate

onedrive

点击链接激活即可
