#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)linux-software.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2014/05/05 19:27:14
#         Changed:  <vinurs 05/05/2014 19:39:17>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


# minimal install

# 安装dnf
sudo yum -y install dnf
# 安装fastestmirror/downloadonly插件
# 自动选择源
sudo dnf install -y yum-fastestmirror 

#安装axelget插件 
# axelget是一个多线程下载工具，yum本身是单线程下载，难怪速度不快呢，
sudo dnf install -y alex

# 先安装priority这个yum的插件，这个插件用来设定安装软件时候软件仓库的优先级，一般是默认先从官方base或者镜像安装，然后从社区用户contribute的软件中安装，再从第三方软件仓库中安装
sudo dnf install -y yum-priorities 

# 安装net-tools,这里面包含了ifconfig之类的命令，因为最小化安装的时候并没有安装
sudo dnf install -y net-tools
# ncureses
sudo dnf install -y ncurses-devel

# for dpdk
sudo dnf install -y libpcap-devel
sudo dnf install -y hwloc

# kvm
sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils

# basic
sudo dnf install -y texinfo

# git log
sudo dnf install -y tig

# clang, 用来给emacs进行自动补全的：emacs auto-complete clang
sudo dnf install -y clang
sudo dnf install -y emacs
# bzr,用来给emacs的增加cedet的时候用的
sudo dnf install -y bzr

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
# for rxvt-unicode
sudo dnf install -y perl-ExtUtils-Embed

sudo dnf install -y gitg

# 锁屏软件
sudo dnf install -y xscreensaver



exit 0
