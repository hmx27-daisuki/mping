#!/bin/bash
#####		一键Ping测试			#####
#####		Author:xiaoz.me			#####
#####		Update:2019-06-03		#####

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin
export PATH

#获取服务器公网IP
osip=$(curl https://api.ttt.sh/ip/qqwry/?type=txt)

location=(
		'广州 电信'
		'广州 联通'
		'广州 移动'
	)
#各地区DNS，来源于http://dns.lisect.com/ and https://www.ip.cn/dns.html
dnsip=(
	'202.96.128.166'	#广州 电信
	'221.5.88.88'		#广州 联通
	'211.136.20.203'	#广州 移动
)
echo '---------------------------------------------------------------------------'
echo "您的本机IP为：[$osip]"
function mping(){
	num=0
	#Ping次数
	pnum=$1

	#echo '---------------------------------------------------------------------------'
	echo "正在进行Ping测试，请稍后..."
	echo '---------------------------------------------------------------------------'

	while(( $num<10 ))
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
	#检查besttrace是否存在
	if [ ! -f "./besttrace" ]
	then
		#下载besttrace
		wget -q http://soft.xiaoz.org/linux/besttrace
		#添加执行权限
		chmod +x ./besttrace
	fi

	#进行路由跟踪
	echo '---------------------------------------------------------------------------'
	echo '正在进行路由跟踪，请稍后...'
	echo '---------------------------------------------------------------------------'
	echo '【广州电信】 - 202.96.128.166'
	echo ''
	./besttrace -q 1 202.96.128.166
	echo '---------------------------------------------------------------------------'

	echo '【广州联通】- 221.5.88.88'
	echo ''
	./besttrace -q 1 221.5.88.88
	echo '---------------------------------------------------------------------------'

	echo '【广州移动】 - 211.136.20.203'
	echo ''
	./besttrace -q 1 211.136.20.203
	echo '---------------------------------------------------------------------------'
}

mping 50
echo ''
moretrace
echo ''
echo '此结果由mping生成:https://www.xiaoz.me/archives/13044'
echo ''
