#2201209-1
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
bash /root/etc/realm.sh run
bash /root/ssr/run.sh
rdate -s time.nist.gov
nohup /etc/update_sh/update.sh >/dev/null 2>&1 &
EOF

wget -O /etc/bw.sh http://git.fyss.me/bw.sh && chmod -R 777 /etc/bw.sh
echo  'bash /etc/bw.sh' >> /etc/profile
rm -f /etc/ll.sh

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
alias realm='bash /root/etc/realm.sh'
alias ssr='python /root/ssr/ssr.py'
alias ll='bash /etc/bw.sh'
EOF
source ~/.bashrc
