#22012014

#更新ssr
cd /root
mv /root/ssr/usermysql.json /root/usermysql.json
rm -rf /root/ssr
wget -N http://git.fyss.me/ss/ssr.zip
unzip ssr.zip
chmod -R a+x ssr
mv -f /root/usermysql.json /root/ssr/usermysql.json
bash /root/ssr/run.sh
rm -f /root/ssr.zip

#更新etc
cd /root
mv /root/etc/r.json /root/r.bak.json
rm -rf /root/etc
rm -f /root/etc.zip
wget -N http://git.fyss.top/etc.zip
unzip etc.zip
chmod -R 777 /root/etc
rm -f /root/etc.zip
bash /root/etc/realm.sh run
