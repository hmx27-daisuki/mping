#安装unzip、下载besttrace程序
apt install unzip -y
wget https://cdn.ipip.net/17mon/besttrace4linux.zip

#解压besttrace、删除zip安装包
unzip besttrace4linux.zip -d besttrace && rm besttrace4linux.zip

#更改besttrace权限
chmod -R +x /root/besttrace/besttrace

#删除tracert.sh（目的是要安装besttrace,安装之后就不需要再次执行tracert.sh）
rm tracert.sh

echo ''
echo '请再次运行 bash mping.sh'
echo ''
