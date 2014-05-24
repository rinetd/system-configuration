#!/bin/zsh
#==============================================================================
#
#        Filename:  @(#)tmux.sh
#
#     Description:  very good ^_^
# 
#         Version:  1.0
#         Created:  2012/08/05 10:24:48
#         Changed:  <vinurs 05/22/2014 21:28:39>
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
    # dpdk
    tmux -2 new-session -s $TMUX_SESSION -n dpdk \; detach-client
    # 打开文件管理器mc，我最喜欢的文件管理器了
    # tmux attach-session -t $TMUX_SESSION \; new-window -n mc \; send-keys 'mc' C-m \; detach-client

    # # 为dropbox专门打开一个
    # tmux attach-session -t $TMUX_SESSION \; new-window -n dropbox \; split-window -h \; detach-client
    # # 用来挂载U盘用
    # tmux attach-session -t $TMUX_SESSION \; new-window -n mnt \; split-window -h \; detach-client
    # # 专门用来配置系统，例如一些脚本之类的
    # # 系统配置的一些东西，然后分屏，一个配置一个看效果
    # tmux attach-session -t $TMUX_SESSION \; new-window -n sys-cfg \; split-window -h \; detach-client
    # # 专门用来配置zsh
    # tmux attach-session -t $TMUX_SESSION \; new-window -n zsh-cfg \; split-window -h \; detach-client
    # # 专门用来分析内核
    # tmux attach-session -t $TMUX_SESSION \; new-window -n kernel-analyse \; send-keys 'cd ~/linux-src-study' C-m \; split-window -h \; detach-client
    # # wiki
    # tmux attach-session -t $TMUX_SESSION \; new-window -n wiki \; send-keys 'cd ~/vinurs.wiki' C-m \; split-window -h \; detach-client
    # emacs，这是专门为mac而定的，主要为了获取里面的PATH路径
   # 我自己认为用linux的时候还是命令行用得比较多，就没有必要用mc了，自己写了一个vinurs-open可以
    # 从命令行打开大多数文件，接下来就是补全它的打开功能了，主要mc的键绑定很不喜欢，配置的语法也觉得很蛋疼
    # tmux attach-session -t $TMUX_SESSION \; new-window -n mc \; detach-client

    # 打开一个专门的terminal用来练习lisp
    # tmux attach-session -t $TMUX_SESSION \; new-window -n lisp \; split-window -h \; detach-client


    # 结尾的一部分window，公用的
    # 一次多创建几个window，省得以后再创建
    #tmux attach-session -t $TMUX_SESSION \; new-window
    # emacs
    # tmux attach-session -t $TMUX_SESSION \; new-window \; send-keys 'test "$system_type"x = "mac"x && emacs' C-m \; send-keys 'exit' C-m \; detach-client
    tmux attach-session -t $TMUX_SESSION \; new-window \; send-keys 'test "$system_type"x = "Darwin"x && emacs' C-m \; detach-client

    tmux attach-session -t $TMUX_SESSION \; new-window 
 
fi



