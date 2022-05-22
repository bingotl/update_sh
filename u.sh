#22523
rm -f /root/aaaa.aaaaa
rm -f /root/test.test
cat > /var/spool/cron/root <<EOF
0 6 */2 * * sudo reboot
*/10 * * * * bash /root/gost/gost.sh run
0 */1 * * * nohup /etc/update_sh/update.sh >/dev/null 2>&1 & #每小时更新脚本

EOF
service crond restart
