mkdir -p /usr/share/fonts/custom
mv Monaco.ttf /usr/share/fonts/custom
chmod 744 /usr/share/fonts/custom

apt install fontconfig xfonts-utils -y

mkfontscale
mkfontdir
fc-cache -fv

列出字体

fc-list :lang=zh
