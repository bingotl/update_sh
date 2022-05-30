#220530
#更新update文件
#cd /root
#wget -N https://raw.githubusercontent.com/bingotl/update_sh/main/update.sh
#\cp /root/update.sh /etc/update_sh/update.sh
#chmod -R 777 /etc/update_sh/update.sh
#/etc/update_sh/update.sh

#定时任务文件
cat > /var/spool/cron/root <<EOF
0 6 */2 * * sudo reboot #重启
0 */1 * * * nohup /etc/update_sh/update.sh >/dev/null 2>&1 & #每小时更新脚本

EOF
service crond restart

更新iptables
wget -N http://git.fyss.me/ban_iptables.sh
chmod -R 777 ban_iptables.sh
./ban_iptables.sh update
