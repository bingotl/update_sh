#220621-1
#
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
nohup /etc/update_sh/update.sh >/dev/null 2>&1 &
#bash /root/etc/ehco.sh run
bash /root/etc/gost.sh run
bash /root/etc/realm.sh run
bash /root/ssr/run.sh
EOF


#定时任务文件
cat > /var/spool/cron/root <<EOF
0 6 */2 * * sudo reboot #重启
0 */1 * * * nohup /etc/update_sh/update.sh >/dev/null 2>&1 & #每小时更新脚本
EOF
service crond restart
