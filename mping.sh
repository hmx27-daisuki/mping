#!/bin/bash
#####		一键Ping测试			#####
#####		Author:xiaoz.me			#####
#####		Forked:hmx27-daisuki		#####

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin
export PATH

location=(
		'广州电信'
		'广州移动'
	 )
#去程/回程ip收集(finalshell软件对单一vps使用路由追踪可找到)
dnsip=(
	'121.8.132.65' 		#广州电信
	'183.233.56.165' 	#广州移动
)
echo '---------------------------------------------------------------------------'
function mping(){
	num=0
	#Ping次数
	pnum=$1

	#echo '---------------------------------------------------------------------------'
	echo "正在进行Ping测试3000次..."
	echo "提示：测试过程需要50-60分钟，请耐心等待..."
	echo '---------------------------------------------------------------------------'

	#测试ip个数
	while(( $num<2 ))
	do
		ping ${dnsip[$num]} -c $pnum > /tmp/${dnsip[$num]}.txt
		echo 【${location[$num]}】 - ${dnsip[$num]}
		echo ''
		tail -2 /tmp/${dnsip[$num]}.txt
		echo '---------------------------------------------------------------------------'
		let "num++"
	done
	echo "【参数说明】"
	echo "x% packet loss: 丢包率"
	echo "min: 最低延迟"
	echo "avg: 平均延迟"
	echo "max: 最高延迟"
	echo "mdev: 平均偏差"

	echo '---------------------------------------------------------------------------'
}

function moretrace(){
	#下载testtrace
		rm -f testrace.sh
		rm -f testrace.sh.1
		rm -f testrace.sh.2
		wget -q https://raw.githubusercontent.com/hijkpw/testrace/master/testrace.sh
		#添加执行权限
		chmod +x ./testrace.sh
	fi

	#进行路由跟踪
	echo '---------------------------------------------------------------------------'
	echo '正在测试回程路由...'
	echo '---------------------------------------------------------------------------'
	echo '【广州电信】 - 121.8.132.65'
	echo ''
	./testtrace -q 1 121.8.132.65
	echo '---------------------------------------------------------------------------'

	echo '【广州移动】 - 183.233.56.165'
	echo ''
	./testtrace -q 1 183.233.56.165
	echo '---------------------------------------------------------------------------'
}

mping 1500
echo ''
moretrace
echo ''
echo '原作者帖子:https://www.xiaoz.me/archives/13044'
echo ''
