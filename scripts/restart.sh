###
 # @Date: 2021.07.06 12:58:55
 # @Description: Automatically execute after system restart
 # @LastEditors: Rustle Karl
 # @LastEditTime: 2022.05.15 09:03:05
###

nginx -c /root/docker/nginx/nginx.conf

~/bin/TeamCity/bin/teamcity-server.sh start

~/bin/TeamCityAgent/bin/agent.sh start


# setsid syncthing serve --home=/root --gui-address=0.0.0.0:8384 &

# cd /root/bin; chmod +x /root/bin/webdav; setsid ./webdav -P=7654 -D=/ &
