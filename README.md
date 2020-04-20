# WSL环境配置脚本
- git
- alinode

# 运行脚本需要提权
```
# 替换 <宿主机用户名> <git仓库账号> 为自己的
cd ~ && rm -f ubuntu.sh && wget https://raw.githubusercontent.com/zyyou/env-wsl/master/ubuntu.sh && chmod +x ./ubuntu.sh && source ubuntu.sh <宿主机用户名> <git仓库账号>

# 如宿主机更新过ssh key则执行此命令同步
cd ~ && rm -f ssh-sync.sh && wget https://raw.githubusercontent.com/zyyou/env-wsl/master/ssh-sync.sh && chmod +x ./ssh-sync.sh && source ssh-sync.sh <宿主机用户名>

```

# 宿主机
- rsa秘钥文件要用相对路径，如 ~/.ssh/xxx

```
Host github.com
    HostName github.com
    User xxxx@xxxx.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/xxxx
```