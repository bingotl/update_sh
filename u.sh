#22012015

#更新realm 
cd /root/etc
rm -f realm
wget -N http://git.fyss.top/realm
chmod -R 777 realm
 /root/etc/realm.sh run
