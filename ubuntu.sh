#!/bin/bash


cd ~

cmdDemo="./install.sh <宿主机用户名> <git邮箱账号> [alinode版本号=v5.15.0]，如：./install.sh zhengyy zhengyy@xxx.com"

# 宿主机用户
user=$1
if  [ ! -n "$user" ] ;then
  echo "缺少参数，参考：${cmdDemo}"
  exit
fi
# echo "user=${user}"

# git用户
gituser=$2
if  [ ! -n "$gituser" ] ;then
  echo "缺少参数，参考：${cmdDemo}"
  exit
fi
# echo "gituser=${gituser}"

echo "配置git"
# 自带 2.17
# sudo apt install git -y
git config --global user.name $user
git config --global user.email $gituser
echo "同步宿主机ssh配置"
wget https://raw.githubusercontent.com/zyyou/env-wsl/master/ssh-sync.sh
chmod +x ssh-sync.sh
./ssh-sync.sh $user


# alinode版本
nodeVer=$3
if  [ ! -n "$nodeVer" ] ;then
  nodeVer="v5.15.0"
fi
alinodeVer="alinode-$nodeVer"

echo "tnvm ${alinodeVer}"
wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash
source ~/.bashrc

echo "安装alinode"
source ~/.bashrc && tnvm install $alinodeVer && tnvm use $alinodeVer

echo "安装nodejs常用包"
npm config set registry https://registry.npm.taobao.org/ && \
  npm i nrm && \
  nrm add hynet http://192.168.5.165:4873/ && \
  nrm use hynet && \
  npm i -g serve typescript

echo "安装常用工具"
# which 自带
sudo apt install -y tree  

cd ~
echo "完成"


