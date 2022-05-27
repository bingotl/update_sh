#220527
#快捷命令文件
cat > /root/.bashrc <<EOF
# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
alias gost='bash /root/etc/gost.sh'
alias ehco='bash /root/etc/ehco.sh'
alias realm='bash /root/etc/realm.sh'
alias ssr='python /root/ssr/ssr.py'

EOF

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
gost run
realm run
ehco run

EOF

source /root/.bashrc

#安装转发
wget -N http://git.fyss.top/etc.zip
unzip etc.zip
chmod -R a+x /root/etc
gost run
realm run
ehco run

#更新update文件
cd /root
wget -N https://raw.githubusercontent.com/bingotl/update_sh/main/update.sh
\cp /root/update.sh /etc/update_sh/update.sh
chmod -R 777 /etc/update_sh/update.sh
