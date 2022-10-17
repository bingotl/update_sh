#2201017-2

cd /root
mv /root/etc/r.json /root/bak.json
rm -rf /root/etc
rm -f /root/etc.zip
wget -N http://git.fyss.top/etc.zip
unzip etc.zip
chmod -R 777 /root/etc
rm -f /root/etc/r.json
mv /root/bak.json /root/etc/r.json
rm -f /root/etc.zip
