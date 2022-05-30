#220530
#更新update文件
#cd /root
#wget -N https://raw.githubusercontent.com/bingotl/update_sh/main/update.sh
#\cp /root/update.sh /etc/update_sh/update.sh
#chmod -R 777 /etc/update_sh/update.sh
#/etc/update_sh/update.sh

更新iptables
wget -N http://git.fyss.me/ban_iptables.sh
chmod -R 777 ban_iptables.sh
./ban_iptables.sh update
