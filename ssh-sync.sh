#!/bin/bash


cd ~/

user=$1
echo "同步宿主机用户 ${user} 的ssh秘钥到子系统"

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

cd ~
echo "完成"


