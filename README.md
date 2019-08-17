README
=========

个人常用的脚本整理，没有后缀的文件，期待把他当做一个命令来使用。

auto_expect.sh
----------------

expect 命令封装，自动执行自定义命名，免手动输入密码等。


go_env_for_vscode.sh
----------------------

为 vscode 搭建 Go 语言环境，解决下载慢的问题。

goget
------

用代理封装 go get，解决更新慢的问题

init_ubuntu.sh
----------------

安装 Ubuntu 后自动安装一些常用的软件及配置

pskill
--------

pkill 或 pgrep 不能模糊搜索(或许我不会)，于是自己封装一个

watch_dog.sh
--------------

自动把登录失败超过三次的 IP 加入黑名单

wsl.vbs
---------

WSL 系统开机启动项管理，放入 start up 目录(1)win + R, input shell:startup

xgit
------

用 find 命令找到当前目录所有的 git 目录，并执行相同的命令，支持 -d 参数 控制层级
