#删除旧版本的mping.sh文件
rm mping.sh && rm mping.sh.1 && rm mping.sh.2 && rm mping.sh.3

#删除多出来的besttrace文件
rm besttrace && besttrace.1 && rm besttrace.2
rm besttrace4linux.zip && besttrace4linux.zip.1 && rm besttrace4linux.zip.2

#安装unzip、下载besttrace程序
apt install unzip -y
wget https://cdn.ipip.net/17mon/besttrace4linux.zip

#解压besttrace、删除zip安装包
unzip besttrace4linux.zip -d besttrace && rm besttrace4linux.zip

#更改besttrace权限
chmod -R +x /root/besttrace/besttrace
