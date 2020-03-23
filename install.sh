#!/bin/bash


cd ~/
user=`whoami`
echo "请输入用户 $user 的git账号，如：xxx@xxx.com"
read gituser

echo "请输入要安装的alinode版本，如：v5.15.0"
read nodeVer
alinodeVer="alinode-$nodeVer"

echo "开始配置环境：git账号=$gituser，alinode=$alinodeVer"

echo "更新系统"
apt update -y
apt upgrade -y

echo "安装git"
apt install git -y
git config --global user.name $user
git config --global user.email $gituser

echo "安装tnvm"
wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash
source ~/.bashrc

echo "安装alinode"
tnvm install $alinodeVer
tnvm use $alinodeVer

echo "同步宿主ssh key"
cp /mnt/c/Users/$user/.ssh ~/

echo "创建工程目录"
mkdir -p ~/projects/frontend ~/projects/document ~/projects/framework ~/projects/basic ~/projects/official ~/projects/customer github aliyun temp

echo "完成"


