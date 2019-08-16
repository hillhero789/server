pssh -h nodes -t 0 -i -x "-t -t" -I</root/VFC-Core1/compile.sh  #所有nodes逐行执行本地的compile.sh文件，永不超时，这条命令行不通



pssh -h nodes screen -dmS vfc "./compile.sh" #新建vfc窗口，在~目录下行脚本，但需要修改compile.sh,增加一行指令，将目录改变值VFC-Core下
pssh -h nodes screen -dmS vfc vfc mine #在名叫vfc的新窗口运行vfc mine指令
#ctrl + a + d 快捷键就可以将当前screen窗口detach了
screen -r vfc #恢复名字叫vfc的窗口


ssh-copy-id user@host

screen -S vfc -X quit #向名字为vfc的屏幕发送关闭命令