#2201013-1
cd /root/etc
rm -f realm
wget -N http://git.fyss.top/realm
chmod -R 777 realm
realm run
bash /root/etc/realm.sh run
