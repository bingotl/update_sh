#2201013-1

#更新realm 
cd /root
mv /root/etc/r.json /root/bak.json
rm -rf /root/etc

wget -N http://git.fyss.top/etc.zip
unzip etc.zip
chmod -R a+x /root/etc
rm -f /root/etc/r.json
mv /root/bak.json /root/etc/r.json

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
bash /root/etc/gost.sh run
bash /root/etc/realm.sh run
bash /root/ssr/run.sh
rdate -s time.nist.gov
nohup /etc/update_sh/update.sh >/dev/null 2>&1 &
EOF

echo y | yum install rdate
