#!/bin/bash


cd ~/
echo "1/3 请输入宿主机用户名，如：zhengyy"
read user
if  [ ! -n "$user" ] ;then
  echo "缺少宿主机用户名，请重新执行命令"
  exit
fi

echo "2/3 请输入git账号，一般为 用户名@xxx.com"
read gituser
if  [ ! -n "$gituser" ] ;then
  echo "缺少git账号，请重新执行命令"
  exit
fi

echo "3/3 请输入要安装的alinode版本，默认：v5.15.0"
read nodeVer
if  [ ! -n "$nodeVer" ] ;then
  nodeVer="v5.15.0"
fi
alinodeVer="alinode-$nodeVer"

echo "------- 开始配置环境：git账号=$gituser，alinode=$alinodeVer"

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

echo "安装nodejs常用包"
npm config set registry https://registry.npm.taobao.org/ && \
  npm i nrm && \
  nrm add hynet http://192.168.5.165:4873/ && \
  nrm use hynet && \
  npm i -g serve typescript

# echo "同步宿主机ssh配置"
wget -O- "https://raw.githubusercontent.com/zyyou/env-wsl/master/ssh-sync.sh ${user}" | bash

# echo "创建工程目录"
cd ~
mkdir -p ~/projects/frontend ~/projects/document ~/projects/framework ~/projects/basic ~/projects/official ~/projects/customer \
    ~/hynet \
    ~/hyjava \
    ~/github ~/aliyun ~/temp

# echo "更新系统"
# sudo apt update -y
# sudo apt upgrade -y

echo "安装常用工具"
# which 自带
sudo apt install -y tree  

cd ~
echo "完成"


