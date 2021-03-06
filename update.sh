#!/bin/bash

# 执行更新子程序
update(){
	\cp $new_ver $path"u.sh"
	chmod -R 777 $path"u.sh"
	bash $path"u.sh"
	
	# 新版本号写到文件上
	echo $b > $old_ver
	 
	# 输出新旧版本号的信息到log文件
	echo "*********************************************"  >> $LOG
	echo $DATE >> $LOG
	echo Old_Ver = $a >> $LOG
	echo New_Ver = $b >> $LOG
}

# 定义文件路径
path="/etc/update_sh/"
if [ ! -d $path ];then
	mkdir $path
	echo -e "\033[32m 文件夹不存在，已创建 \033[0m" 
fi

old_ver=$path"old_ver.txt"
new_ver=$path"new_ver.txt"
LOG=$path"update.log"
DATE=`date`
 
# 版本号文件，如果不存在，那么自动创建一个
if [ ! -e "$old_ver" ] ; then
touch "$old_ver"
fi
if [ ! -e "$new_ver" ] ; then
touch "$new_ver"
fi

wget -q -O $new_ver https://raw.githubusercontent.com/bingotl/update_sh/main/u.sh

#ture 强制执行
case "$1" in
"true")
	wget -q -O $new_ver https://raw.githubusercontent.com/bingotl/update_sh/main/u.sh
	update
	echo -e "\033[33m 强制执行更新 \033[0m"
;;

#else
*)

	# 获取最新版本号，和旧版本号对比

	a=`cat $old_ver`
	b=`head -n 1 $new_ver`
	
	# 先输出新旧版本号的信息
	echo $DATE
	echo Old Ver = $a
	echo New Ver = $b
	
	# 对比
	if [[ $a != "$b" ]]
	then
		# 如果版本号不一致，执行更新
		update
		echo 版本号不一致，已执行更新 >> $LOG
		echo -e "\033[33m 版本号不一致，已执行更新 \033[0m"
	else
		# 如果版本号相同，就不需要不需要操作，输出信息就可以
		echo -e "\033[33m 无需更新 \033[0m"
	fi

;;

esac
