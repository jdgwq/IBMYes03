#! /bin/bash
yum install git wget curl unzip perl moreutils -y
apt-get install git wget curl unzip perl moreutils -y
cd /home
mkdir myid
cd myid
mkdir jd
cd jd
wget http://pan.illii.cn/file/5fbdca64f785d904054b8092/fc96a4d93f77d71731e45b86f9e8d30a/jd-unicom.zip
unzip jd-unicom.zip
cp sample/config.sh.sample config/config.sh
cp sample/computer.list.sample config/crontab.list
cp sample/auth.json config/auth.json
chmod +x /home/myid/jd
cd /home/myid
wget https://nodejs.org/dist/v14.15.4/node-v14.15.4-linux-x64.tar.xz
tar -xvf node-v14.15.4-linux-x64.tar.xz
mv node-v14.15.4-linux-x64 nodejs
ln -s /home/myid/nodejs/bin/npm /usr/local/bin/
ln -s /home/myid/nodejs/bin/node /usr/local/bin/
cd /home/myid/nodejs/lib/node_modules
wget http://pan.illii.cn/file/5fbdca64f785d904054b8092/1dbf522d0ea3ca8b31e45b86f9e8d30a/pm2.zip
unzip pm2.zip
cd /usr/bin
ln -s /home/myid/nodejs/lib/node_modules/pm2/bin/pm2 pm2
cd /home/myid/jd/AutoSignMachine
npm i
pm2 start /home/myid/jd/panel/server.js
pm2 startup
pm2 save
echo "---------- 安装完成 ----------"
echo " 控制面板默认用户名admin"
echo " 控制面板默认密码adminadmin"
echo " 控制面板请访问您的IP:5678"
echo "----------------------------------------"
echo " 使用教程请查看控制面板"
echo
echo " BY:莫老师一键illii.cn"
echo
echo " 注意请不要退出 10秒后进行首次初始化"
echo "----------------------------------------"
sleep 10s
bash /home/myid/jd/git_pull.sh