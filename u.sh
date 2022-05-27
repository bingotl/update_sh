#220527
#开机启动文件
cat > /etc/rc.d/rc.local <<EOF
#!/bin/bash
# THIS FILE IS ADDED FOR COMPATIBILITY PURPOSES
#
# It is highly advisable to create own systemd services or udev rules
# to run scripts during boot instead of using this file.
#
# In contrast to previous versions due to parallel execution during boot
# this script will NOT be run after all other services.
#
# Please note that you must run 'chmod +x /etc/rc.d/rc.local' to ensure
# that this script will be executed during boot.

touch /var/lock/subsys/local
ulimit -n 512000
bash /root/ssr/run.sh
bash /root/etc/gost.sh run
bash /root/etc/ehco.sh run
bash /root/etc/realm.sh run

EOF

#更新iptables
#wget -N http://git.fyss.me/ban_iptables.sh
#chmod -R 777 ban_iptables.sh
#./ban_iptables.sh update

