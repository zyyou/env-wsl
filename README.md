# WSL环境配置脚本
- git
- alinode

# 运行脚本需要提权
```
wget -O- https://raw.githubusercontent.com/zyyou/env-wsl/master/ubuntu.sh | bash

# 或者下载后
source ./ubuntu.sh
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