#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)xwindow-startup.sh
#
#     Description:  only for xwindow
# 
#         Version:  1.0
#         Created:  2012/03/30 16:02:35
#         Changed:  <vinurs 02/08/2014 15:46:57>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##

# 最先启动的就是输入法，后面的程序都要依赖输入法来的
#if ps -ef |grep ibus-daemon | grep -v grep 1>/dev/null 2>&1; then
#  :
#else
#   ibus-daemon -d -x &
#fi

# first, emacs
#xec
# ps -ef |grep 'emacs --daemon' | grep -v 'grep' >/dev/null || (emacs --daemon >/dev/null 2>&1 &) 

# xmodmap
xmodmap.sh -o &

# fcitx 输入法
fcitx &

# dock beautiful
# cairo-dock -o &

# fbpanel
fbpanel &

#tint2
#tint2 &




# 设置背景
# xloadimage -onroot -fullscreen /home/vinurs/vinurs/.sawfish/images/wallpaper/bg.jpg
chgbg.sh &

# 屏保的启动
xscreensaver -nosplash &

# ftp服务器
filezilla &

# pidgin
pidgin &

# 文件管理器
# emelfm2 &

# 开启透明功能
xcompmgr >/dev/null &

# crontab
crontab ~/.cron.d/crontab

# shutter截图工具 
shutter &

# dropbox
proxychains ~/.dropbox-dist/dropboxd &
# ~/.dropbox-dist/dropboxd &


# xmodmap
xmodmap.sh -o &


exit 0
