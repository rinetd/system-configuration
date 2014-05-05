#!/bin/sh
#==============================================================================
#
#        Filename:  @(#)restore-sys.sh
#
#     Description:  for restore my system for new installation
# 
#         Version:  1.0
#         Created:  2012/03/19 22:46:10
#         Changed:  <vinurs 02/17/2014 14:49:53>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##

# Changelog
# 2013-10-21:在fedora18以后我会逐步将YUM替换成DNF


# todo
 
# 添加源
# cd ~/.personal/
# sudo cp -f  163.repo  /etc/yum.repos.d/
# cd /etc/yum.repos.d/
# sudo yum makecache

cd ~

# copy repos
cd ~/$USER/.backup/system/
sudo cp -rf *.repo /etc/yum.repos.d/
# copy dns config
sudo cp -f resolv.conf /etc/

cd -

# 安装dnf
sudo yum -y install dnf


# 安装fastestmirror/downloadonly插件
# 自动选择源
sudo dnf install -y yum-fastestmirror 

#安装axelget插件 
# axelget是一个多线程下载工具，yum本身是单线程下载，难怪速度不快呢，
sudo dnf install -y alex

# 先安装priority这个yum的插件，这个插件用来设定安装软件时候软件仓库的优先级，一般是默认先从官方base或者镜像安装，然后从社区用户contribute的软件中安装，再从第三方软件仓库中安装
dnf install -y yum-priorities 

# 安装net-tools,这里面包含了ifconfig之类的命令，因为最小化安装的时候并没有安装
sudo dnf install -y net-tools
# ncureses
sudo dnf install ncurses-devel

# kvm
sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils

# basic
 sudo dnf install texinfo
# google-chrome
sudo dnf install -y google-chrome
# google talk
wget http://dl.google.com/linux/direct/google-talkplugin_current_x86_64.rpm
sudo dnf install google-talkplugin_current_x86_64.rpm --nogpgcheck
rm -rf google-talkplugin_current_x86_64.rpm

# screenruler, fun
sudo dnf install -y screenruler
# wireshark
sudo dnf install -y wireshark

# meld 类似于compare的工具
sudo dnf install -y meld

# filelight图形化显示磁盘空间的工具
sudo dnf install -y filelight

# dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
cd -

# sbcl: for common lisp
sudo dnf install -y sbcl cl-asdf

# for wps
sudo dnf install -y libICE.so libX11.so.6 libSM.so.6 libXext.so.6 libXrender.so.1
sudo dnf install -y libfontconfig.so.1 libfreetype.so.6 libgcc_s.so.1
sudo dnf install -y libglib-2.0.so.0 libgobject-2.0.so.0 libgthread-2.0.so.0 libmng.so.1
sudo dnf install -y  libcups.so.2 libpng12.so.0 libGLU.so.1

# virtualbox

# pip: python tools
sudo dnf install -y python-pip

# for final term
sudo dnf install -y git cmake vala intltool libgee-devel gnome-common gtk-doc gtk3-devel keybinder3-devel libmx-devel clutter-gtk-devel libnotify-devel

# fvwm
#sudo dnf install -y fvwm

# cscope-indexer
sudo dnf install -y cscope
# global 
sudo dnf install -y global
# mutt 邮件处理软件
sudo dnf install -y mutt
# vim
sudo dnf install -y vim gvim
# vlock 用来锁住终端, tmux需要，不过看着好像有bug
sudo dnf install -y vlock
# expect 模拟用户自动输入
sudo dnf install -y expect
# filezilla ftp图形工具
sudo dnf install -y filezilla
# stardict 最好用的辞典
# sdcv跟emacs结合起来
sudo dnf install -y stardict sdcv
# shutter截图工具，很好很强大
sudo dnf install -y shutter
# dia 画流程图之类的软件
sudo dnf install -y dia
# wget 很好的下载软件
sudo dnf install -y wget
# git 相关
sudo dnf install -y git git-svn subversion-perl perl-Git-SVN
# 这里git还缺少一个git-html，后面补上

# zsh 很好用的shell
sudo dnf intall -y zsh

# urxvt
sudo dnf install -y rxvt-unicode
# tmux
sudo dnf install -y tmux
# fcitx
sudo dnf install -y 'fcitx*'
# system monitor
# htop 比top更好的软件
# glances 用python写的一个好用的工具
sudo dnf install -y  htop glances

#    chmsee dia shutter wget expect wqy* pidgin thunderbird telnet \
#    xloadimage xscreensaver xclip kchmviewer xchm getmail msmtp lynx w3m w3m-img \
#    wvware fortune* gimp qiv libnotify git zsh perl xcompmgr ruby gperf \
#    emelfm2 xsel conky proxychains global lrzsz guile perl-TermReadKey \
#    nmap vsftpd tftp-server


# chmsee chm阅读器，很不错
# wqy* 文泉驿字体
# pidgin 聊天工具
# thunderbird 邮件客户端
# xloadimage 用来设置桌面背景的，可以设置为每隔一段时间执行一次
# xscreensaver 用来设置屏保的程序，设置为开机以后自动自动
# xclip 剪切板
# kchmviewer xchm chm阅读器
# getmail 收取邮件
# msmtp 发邮件
# lynx mutt用它来转换html到txt
# w3m mutt 用来显示网页和图片
# w3m-img 用来显示图片
# wvware mutt用来把word转换成html
# fortune 用来随机生成mutt签名
# gimp linux下的图片处理工具，号称linux下的photoshop
# qiv 终端下面的图片查看工具
# libnotify 用来进行邮件提醒的
# perl rxvt-unicode要用
# xcompmgr 配合rxvt-unicode来实现透明用的,这个是专门用来进行透明的设置的
# yum -y groupinstall "X Software Development"
#  gperf 编译webkit要用
# emelfm2很不错的文件管理器
# xsel 剪贴板
# conky 用于X视窗系统的系统监视
# proxychains 用来用socket代理上网的工具,打开dropbox的时候需要用到
# gun global 源码跳转工具，貌似比cscope更强大
# lrzsz用来在securecrt里面上传、下载文件的工具
# guile scheme解释器
# perl-TermReadKey 用来装nevernote的
# nmap 端口扫描工具,很不错的一款软件
# vsftpd ftp服务器
# tftp-server tftp服务器


# install softwares
sudo yum install -y mutt cscope \
    vim gvim vlock expect filezilla stardict sdcv emacs \
    chmsee dia shutter wget expect wqy* pidgin thunderbird telnet \
    xloadimage xscreensaver xclip kchmviewer xchm getmail msmtp lynx w3m w3m-img \
    wvware fortune* gimp qiv libnotify git zsh perl xcompmgr htop  gperf \
    emelfm2 xsel conky proxychains global lrzsz guile perl-TermReadKey \
    nmap vsftpd tftp-server

# proxychains
sudo dnf install -y proxychains libproxychains.so.3

# cairo
sudo rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
sudo dnf install -y cairo-dock\*
sudo dnf install -y cairo-dock cairo-dock-plug-ins cairo-clock


# x11 vnc server
sudo dnf install -y tigervnc-server

# 字体配置需要的软件
sudo dnf install -y fontforge

# pidgin相关的东西
# pidgin 很好的聊天集成工具
# sudo yum install pidgin-devel 编译pidgin的插件的时候需要的一些东西
# icu 编译webkit的时候需要的
sudo dnf install -y pidgin pidgin-devel webkitgtk webkitgtk-devel icu

# 这个命令可以用来查看当前系统中的分区的文件系统格式
sudo dnf install -y parted

# git gnome的图形工具
sudo dnf install -y gitk

# git kde的图形工具
sudo dnf install -y kgit


# 这里以后增加erase ibus,因为我现在喜欢用小企鹅


# X11相关的头文件和库，编译软件的时候经常用到
yum -y groupinstall "X Software Development"

# wmctrl 这个软件不错，我现在主要用它在控制emacs的客户端
sudo dnf install -y wmctrl

# change the default shell to zsh
sudo usermod -s /bin/zsh $USER

# sawfish相关,很好的窗口管理器
sudo dnf install -y sawfish librep rep-gtk
# 用来给sawfish增加taskbar
sudo dnf install -y fbpanel


# ruby, rubygems for jekyll
sudo dnf install -y ruby rubygems ruby-devel
# jekyll for writing blog in github


# download confused ssh
cd ~/vinurs/.backup
wget -c https://github.com/brl/obfuscated-openssh/archive/master.zip
# for confused ssh
sudo dnf install -y openssl-devel

cd -

# mkdir some directories
# virtualbox directory
if [[ ! -d ~/.virtualBox ]]; then
    mkdir ~/.virtualBox
fi

# git clone vinurs-wiki
cd ~/
git clone https://haiyuan.vinurs@code.google.com/p/vinurs.wiki/ 
cd -


exit 0
