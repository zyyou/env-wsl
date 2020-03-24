#!/bin/bash


cd ~/
user=`whoami`
echo "1/2 请输入用户 $user 的git账号，如：xxx@xxx.com"
read gituser

echo "2/2 请输入要安装的alinode版本，如：v5.15.0"
read nodeVer
alinodeVer="alinode-$nodeVer"



echo "------- 开始配置环境：git账号=$gituser，alinode=$alinodeVer"

echo "更新系统"
# sudo apt update -y
# sudo apt upgrade -y

echo "安装git"
# 自带 2.17
# sudo apt install git -y
git config --global user.name $user
git config --global user.email $gituser

echo "安装tnvm"
wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash
source ~/.bashrc

echo "安装alinode"
tnvm install $alinodeVer
tnvm use $alinodeVer

echo "安装常用工具"
# which 自带
sudo apt install -y tree  

echo "安装nodejs常用包"
npm config set registry https://registry.npm.taobao.org/ && \
  npm i nrm && \
  nrm add hynet http://192.168.5.165:4873/ && \
  nrm use hynet && \
  npm i -g serve @vue/cli typescript

# echo "同步宿主机ssh配置"
if [ -e ~/.ssh ]
then 
  rm -f ~/.ssh/*
else
  mkdir ~/.ssh
fi
echo "1" > ~/.ssh/该目录自动与宿主机同步.txt
cp -r /mnt/c/Users/$user/.ssh/ ~/.ssh
cd ~/.ssh
chmod -R 400 ~/.ssh/*

# echo "创建工程目录"
# cd ~
# mkdir -p ~/nodejs/frontend ~/nodejs/document ~/nodejs/framework ~/nodejs/basic ~/nodejs/official ~/nodejs/customer \
#     ~/hynet \
#     ~/hyjava \
#     ~/github ~/aliyun ~/temp

ce ~
echo "完成"


