#220621-1
#

cat > /etc/systemd/system/rc-local.service <<EOF
0 6 */2 * * sudo reboot #重启
0 */3 * * * bash /root/etc/realm.sh run >/dev/null 2>&1 & #每隔3小时重启realm
0 */1 * * * nohup /etc/update_sh/update.sh >/dev/null 2>&1 & #每隔1小时更新脚本
EOF

service crond restart

cd /root/etc
wget -N http://git.fyss.me/realm.zip
rm -f /root/etc/realm /root/etc/realm.sh
unzip realm.zip
chmod -R a+x /root/etc
rm -f /root/etc/realm.zip

sed -i '$d' /etc/profile
echo  'echo node_id: $(cat /root/ssr/usermysql.json | sed '"'"'s/,/\n/g'"'"' | grep '"'"'node_id'"'"' | sed '"'"'s/:/\n/g'"'"' | sed '"'"'1d'"'"')' >> /etc/profile
