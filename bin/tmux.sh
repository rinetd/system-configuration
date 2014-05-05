#!/bin/zsh
#==============================================================================
#
#        Filename:  @(#)tmux.sh
#
#     Description:  very good ^_^
# 
#         Version:  1.0
#         Created:  2012/08/05 10:24:48
#         Changed:  <vinurs 02/08/2014 15:41:15>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


# tmux
# 如果没有urxvt的session，那么建立这个session，如果存在，但是没有人attach
# 那么attach，如果已经有人attach了这个session，那么什么也不干
# 并且在公司跟在家里的时候要打开的窗口是不一样的

TMUX_SESSION=urxvt

if
    tmux has-session -t $TMUX_SESSION
then
    if
        tmux list-sessions | grep "$TMUX_SESSION" | grep -v "attached" &> /dev/null
    then
        tmux attach-session -t $TMUX_SESSION 
    fi
else
    # 下面就开始创建新的session
    # 开头的几个window，公用的
    # 默认打开叫sys-monitor的窗口，专门用来监控系统当前的性能的
    tmux -2 new-session -s $TMUX_SESSION -n sys-monitor \; detach-client
    # 打开文件管理器mc，我最喜欢的文件管理器了
    tmux attach-session -t $TMUX_SESSION \; new-window -n mc \; send-keys 'mc' C-m \; detach-client

    # 为dropbox专门打开一个
    tmux attach-session -t $TMUX_SESSION \; new-window -n dropbox \; split-window -h \; detach-client
    # 用来挂载U盘用
    tmux attach-session -t $TMUX_SESSION \; new-window -n mnt \; split-window -h \; detach-client
    # 专门用来配置系统，例如一些脚本之类的
    # 系统配置的一些东西，然后分屏，一个配置一个看效果
    tmux attach-session -t $TMUX_SESSION \; new-window -n sys-cfg \; split-window -h \; detach-client
    # 专门用来配置zsh
    tmux attach-session -t $TMUX_SESSION \; new-window -n zsh-cfg \; split-window -h \; detach-client
    # 专门用来分析内核
    tmux attach-session -t $TMUX_SESSION \; new-window -n kernel-analyse \; send-keys 'cd ~/linux-src-study' C-m \; split-window -h \; detach-client
    # wiki
    tmux attach-session -t $TMUX_SESSION \; new-window -n wiki \; send-keys 'cd ~/vinurs.wiki' C-m \; split-window -h \; detach-client
    
    # 我自己认为用linux的时候还是命令行用得比较多，就没有必要用mc了，自己写了一个vinurs-open可以
    # 从命令行打开大多数文件，接下来就是补全它的打开功能了，主要mc的键绑定很不喜欢，配置的语法也觉得很蛋疼
    # tmux attach-session -t $TMUX_SESSION \; new-window -n mc \; detach-client

    # 打开一个专门的terminal用来练习lisp
    # tmux attach-session -t $TMUX_SESSION \; new-window -n lisp \; split-window -h \; detach-client

    # 公司跟家里有时候需要打开的不同的windows 
    if [[ $COMPUTER_ADDR = "company" ]]; then
        # 公司里面要打开的一些窗口
        # embedway
        # tmux attach-session -t $TMUX_SESSION \; new-window -n embedway \; detach-client
        # h3c
        # tmux attach-session -t $TMUX_SESSION \; new-window -n h3c \; send-keys 'telnet 10.1.165.20 10003' C-m C-m\; split-window -h \; \
        #     send-keys 'telnet 10.1.165.20 10004' C-m C-m \; detach-client
        # sf2300
        # tmux attach-session -t $TMUX_SESSION \; new-window -n sf2300 \; send-keys 'telnet 10.1.165.20 10008' C-m \; split-window -h \; \
        #     detach-client
        # wisco mstp
        # tmux attach-session -t $TMUX_SESSION \; new-window -n mstp-wisco \; send-keys 'cd ~/embedway/software/oceanway/mstp-wisco/trunk/source' C-m \; \
        #     split-window -h \; send-keys 'cd ~/embedway/software/oceanway/mstp-wisco/trunk/source' C-m \; \
        #     detach-client
        # 26x2
        # tmux attach-session -t $TMUX_SESSION \; new-window -n 26x2 \; send-keys 'telnet 10.1.165.20 10005' C-m \; split-window -h \; \
        #     detach-client
        # 26x2 mstp
        # tmux attach-session -t $TMUX_SESSION \; new-window -n 26x2-mstp \; \
        #     detach-client

        # wisco src cps
        # tmux attach-session -t $TMUX_SESSION \; new-window -n wisco-cps \; send-keys 'cd ~/embedway/software/oceanway/cps/trunk/source' C-m \; split-window -h \; \
        #     detach-client

        # horizon200
        # tmux attach-session -t $TMUX_SESSION \; new-window -n horizon200 \; send-keys 'cd ~/embedway/horizon200' C-m \; split-window -h \; \
        #     detach-client

    else
        # 家里要打开的一些窗口
        # 默认打开叫sys-monitor的窗口，专门用来监控系统当前的性能的
        # tmux -2 new-session -s $TMUX_SESSION -n sys-monitor \; send-keys htop C-m \; detach-client
        # # 系统配置的一些东西，然后分屏，一个配置一个看效果
        # tmux attach-session -t $TMUX_SESSION \; new-window -n sys-cfg \; split-window -h \; detach-client
    fi

    # 结尾的一部分window，公用的
    # 一次多创建几个window，省得以后再创建
    # tmux attach-session -t $TMUX_SESSION \; new-window \; detach-client
    # tmux attach-session -t $TMUX_SESSION \; new-window \; detach-client
    tmux attach-session -t $TMUX_SESSION \; new-window

fi



