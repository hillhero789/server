pssh -h nodes -t 0 -i -x "-t -t" -I</root/VFC-Core1/compile.sh  #所有nodes逐行执行本地的compile.sh文件，永不超时，这条命令行不通



pssh -h nodes screen -dmS vfc "./compile.sh" #新建vfc窗口，在~目录下行脚本，但需要修改compile.sh,增加一行指令，将目录改变值VFC-Core下
pssh -h nodes screen -dmS vfc vfc mine #在名叫vfc的新窗口运行vfc mine指令
#ctrl + a + d 快捷键就可以将当前screen窗口detach了
screen -r vfc #恢复名字叫vfc的窗口


ssh-copy-id user@host #复制ssh key到远程电脑

screen -S vfc -X quit #向名字为vfc的屏幕发送关闭命令










#用screen运行任意指令
第一步、先建立screen name
shell>screen -dmS test

第二步、发送要执行的命令
shell>screen -r test -p 0 -X stuff "top"   #用pssh时好像删除 -p 0 才能成功  pssh -h nodes "screen -r test -X stuff 'vfc update\n'"

第三步、发送一个回车符，让top命令运行起来
shell>screen -r test -p 0 -X stuff $'\n'

参数说明：
-r 恢复/进入一个screen
-p 0 指定第一个(从0开始)window,一个screen里可以有几个window，这里只需要指定第一个，不然会在某些情况下不生效。
-X 执行一个指定的screen支持的command
stuff 是-X的第一个参数，也是screen支持的一个command，意思是粘贴一个string
"top" 是粘贴的string 内容
$'\n' 是粘贴一个回车符进去，以此来执行screen里面的top命令