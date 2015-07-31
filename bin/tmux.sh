#!/bin/zsh
#==============================================================================
#
#        Filename:  @(#)tmux.sh
#
#     Description:  very good ^_^
# 
#         Version:  1.0
#         Created:  2012/08/05 10:24:48
#         Changed:  <vinurs 05/25/2015 10:57:25>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


# open emacs
# qec

# tmux
# 如果没有urxvt的session，那么建立这个session，如果存在，但是没有人attach
# 那么attach，如果已经有人attach了这个session，那么什么也不干
# 并且在公司跟在家里的时候要打开的窗口是不一样的

TMUX_SESSION=vinurs-tmux

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
    # system configuration
    tmux attach-session -t $TMUX_SESSION \; new-window -n sys-cfg\; send-keys 'cd ~/system-configuration' C-m \; split-window -h \; send-keys 'cd ~/system-configuration' C-m \; detach-client
    # emacs
    tmux attach-session -t $TMUX_SESSION \; new-window -n emacs \; split-window -h \; detach-client
    # git
    tmux attach-session -t $TMUX_SESSION \; new-window -n git \; split-window -h \; detach-client
    # blog
    tmux attach-session -t $TMUX_SESSION \; new-window -n blog \; split-window -h \; detach-client
    # lisp
    tmux attach-session -t $TMUX_SESSION \; new-window -n lisp \; split-window -h \; detach-client
    # other
    tmux attach-session -t $TMUX_SESSION \; new-window  \; detach-client
	

    tmux attach-session -t $TMUX_SESSION \; new-window 
 
fi



