#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)linux-software.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2014/05/05 19:27:14
#         Changed:  <vinurs 11/06/2014 18:05:43>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


# minimal install

# 安装dnf
sudo yum -y install deltarpm
sudo yum -y install dnf
# 安装fastestmirror/downloadonly插件
# 自动选择源
sudo dnf install -y yum-fastestmirror 

# gcc
sudo dnf install -y gcc
# kernel header
sudo dnf install "kernel-devel-uname-r == $(uname -r)"

#安装axelget插件 
# axelget是一个多线程下载工具，yum本身是单线程下载，难怪速度不快呢，
sudo dnf install -y alex

# 先安装priority这个yum的插件，这个插件用来设定安装软件时候软件仓库的优先级，一般是默认先从官方base或者镜像安装，然后从社区用户contribute的软件中安装，再从第三方软件仓库中安装
sudo dnf install -y yum-priorities 

# 安装net-tools,这里面包含了ifconfig之类的命令，因为最小化安装的时候并没有安装
sudo dnf install -y net-tools
# ncureses
sudo dnf install -y ncurses-devel

sudo dnf install -y uuid-devel
sudo dnf install -y libuuid-devel

# ftp server
sudo dnf install -y vsftpd

# for dpdk
sudo dnf install -y libpcap-devel
sudo dnf install -y hwloc

# kvm
sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils

# basic
sudo dnf install -y texinfo

# ruby
sudo dnf install -y ruby
# git log
sudo dnf install -y tig

# clang, 用来给emacs进行自动补全的：emacs auto-complete clang
sudo dnf install -y clang
sudo dnf install -y emacs
# bzr,用来给emacs的增加cedet的时候用的
sudo dnf install -y bzr
# linux读邮件需要
sudo dnf install -y emacs-w3m
sudo dnf install -y xdvi

# for common lisp
sudo dnf install -y sbcl


# cmake
sudo dnf install -y cmake
sudo dnf install -y libstdc++.so.6

# cscope-indexer
sudo dnf install -y cscope
# global 
sudo dnf install -y global
# vim
sudo dnf install -y vim 
# expect 模拟用户自动输入
sudo dnf install -y expect
# wget 很好的下载软件
sudo dnf install -y wget
# git 相关
sudo dnf install -y git git-svn subversion-perl perl-Git-SVN
sudo dnf install -y libserf-devel
# svn
sudo dnf install -y 'svn*'
sudo dnf install -y 'sqlite*'
# zsh 很好用的shell
sudo dnf install -y zsh
# sshfs
sudo dnf install -y sshfs

# tmux
sudo dnf install -y tmux
sudo dnf install -y xclip
# rxvt-unicode
sudo dnf install -y rxvt-unicode
# glances 用python写的一个好用的工具
sudo dnf install -y  htop glances
# collectl，比htop更好的系统监控工具
sudo dnf install -y collectl

# for emacs doxymacs
sudo dnf install -y libxml2-devel

sudo dnf install -y pidgin
# mpstat
sudo dnf install -y sysstat

# proxychains
sudo dnf install -y proxychains libproxychains.so.3


# exit 0

# XWindows advanced install

sudo dnf install -y shutter
sudo dnf install -y sawfish
# using for changing background pic
sudo dnf install -y feh
sudo dnf install -y fbpanel
# for google-chrome
sudo dnf install -y lsb
# sdcv词典
sudo dnf install -y sdcv

sudo dnf install -y 'fcitx*'

sudo dnf install -y filezilla

sudo dnf install -y wmctrl
sudo dnf install -y xsel


sudo dnf install -y wireshark
sudo dnf install -y tcpdump
sudo dnf install -y tcpreplay
sudo dnf install -y libpcap
sudo dnf install -y libpcap-devel
# for rxvt-unicode
sudo dnf install -y perl-ExtUtils-Embed

sudo dnf install -y gitg

# dia
sudo dnf install -y dia

# 锁屏软件
sudo dnf install -y xscreensaver

# for wps
sudo dnf install -y bICE.so.6 
sudo dnf install -y libSM.so.6 
sudo dnf install -y libX11.so.6 
sudo dnf install -y libXext.so.6
sudo dnf install -y libXrender.so.1
sudo dnf install -y libfontconfig.so.1 
sudo dnf install -y libfreetype.so.6
sudo dnf install -y libglib-2.0.so.0
sudo dnf install -y libgobject-2.0.so.0
sudo dnf install -y libgthread-2.0.so.0
sudo dnf install -y libmng.so.1
sudo dnf install -y libz.so.1
sudo dnf install -y libcups.so.2
sudo dnf install -y libpng12.so.0 
sudo dnf install -y libGLU.so.1


# snmp
sudo dnf install -y net-snmp
sudo dnf install -y net-snmp-perl 
sudo dnf install -y net-snmp-utils 

# for github blog
sudo dnf install -y npm
sudo npm install -g hexo 

# pandoc
sudo dnf install -y pandoc

# astyle
sudo dnf install -y astyle

# nvm
sudo dnf install -y tcsh scons gcc-c++ glibc-devel openssl-devel git python
git clone git://github.com/creationix/nvm.git ~/.nvm
NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
nvm install 0.10




