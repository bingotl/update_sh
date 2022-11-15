#2201017-2

cd /root
rm -rf /root/ssr
wget -N http://git.fyss.me/ss/ssr.zip
unzip ssr.zip
chmod -R a+x ssr
python /root/ssr/pip.py
pip install -r /root/ssr/requestment.txt
rm -f /root/ssr.zip
