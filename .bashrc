# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# add my own tools
# export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:~/bin

#设置我的shell提示符
#[user@localhost ~]$ 
export PS1="\[\e[33m[\e[1;34m\]\u\[\e[0m\e[31m\]@\[\e[1;35m\]\h \[\e[36m\]\W\[\e[0m\e[33m\]]\[\e[32m\]$\[\e[0m\] \a"
# change title automatically
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'

export EVENT_NOEPOLL=1

# export EDITOR=emacsclient
# export VISUAL=emacsclient
export EDITOR=vim
export VISUAL=vim

#export TERM=rxvt-unicode

#set locale
export LANG="en_US.UTF-8"
export LC_CTYPE="zh_CN.UTF-8"
export LC_NUMERIC="zh_CN.UTF-8"
export LC_TIME="zh_CN.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="zh_CN.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="zh_CN.UTF-8"
export LC_NAME="zh_CN.UTF-8"
export LC_ADDRESS="zh_CN.UTF-8"
export LC_TELEPHONE="zh_CN.UTF-8" 
export LC_MEASUREMENT="zh_CN.UTF-8"
export LC_IDENTIFICATION="zh_CN.UTF-8"
export LC_ALL="en_US.UTF-8"


export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"


#man 自动补全
complete -cf man


#alias
alias ls='ls --color=auto'

# my own profile
alias g-prog='cd ~/programmes'
alias g-dea='cd ~/dea-read-only'
alias g-shell='cd ~/programmes/shell/'
alias g-lisp='cd ~/programmes/lisp/'
alias g-emacs='cd ~/.emacs.d'
alias g-algorithms='cd ~/programmes/c/algorithms'


# tmux
# if tmux urxvt has been on, do nothing, else execute tmux urxvt
# 如果没有urxvt的session，那么建立这个session，如果存在，但是没有人attach
# 那么attach，如果已经有人attach了这个session，那么什么也不干 
if
    tmux has-session -t urxvt 1>/dev/null 2>&1
then
    if
        tmux list-sessions | grep "urxvt" | grep -v "attached" &> /dev/null
    then
        tmux attach-session -t urxvt 
    fi
else
# 新建session的时候开启下面几个窗口的应用程序
# 0: mc窗口，专门用来文件管理
    tmux -2 new-session -s urxvt -n "mutt" mutt \; \
        new-window -n "mc" mc \; \
        new-window -n "embedway" \; \
        new-window -n "tftp" \; \
        new-window -n "compile" \; \
        new-window -n "openwrt"
fi


# company's setup
if [ -f ~/.company ]; then
	. ~/.company
fi



