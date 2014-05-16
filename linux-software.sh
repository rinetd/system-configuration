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
dnf install -y yum-priorities 

# 安装net-tools,这里面包含了ifconfig之类的命令，因为最小化安装的时候并没有安装
sudo dnf install -y net-tools
# ncureses
sudo dnf install ncurses-devel

# kvm
sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils

# basic
sudo dnf install -y texinfo

# git log
sudo dnf install -y tig

# clang, 用来给emacs进行自动补全的：emacs auto-complete clang
sudo dnf install -y clang
# bzr,用来给emacs的增加cedet的时候用的
sudo dnf install -y bzr

# for common lisp
sudo dnf install -y sbcl

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
# zsh 很好用的shell
sudo dnf intall -y zsh
# tmux
sudo dnf install -y tmux
# glances 用python写的一个好用的工具
sudo dnf install -y  htop glances

# proxychains
sudo dnf install -y proxychains libproxychains.so.3


# exit 0

# advanced install



exit 0
