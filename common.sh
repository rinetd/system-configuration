#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)common.sh
#
#     Description:  common for mac and linux
# 
#         Version:  1.0
#         Created:  2014/05/05 11:03:38
#         Changed:  <vinurs 05/05/2014 11:50:34>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##

#  NULL
files_common=()
# bin
files_common+=(bin)

# bash
# 虽然我不用bash，但是还是保留着相关的配置
files_common+=(.bashrc .bash_profile .bash_logout)
# zsh
files_common+=(.zshrc .zshenv .zsh .zprofile .zlogin .zlogout)
# tmux
files_common+=(.tmux.conf .tmux)
# vim
files_common+=(.vimrc)
# sbcl
files_common+=(.sbclrc)
# htop
files_common+=(.htoprc)
# indent
files_common+=(.indent.pro)
# lftp
files_common+=(.lftp)
# mailcap
files_common+=(.mailcap)
# emacs
files_common+=(.emacs .emacs.d)
# conky
files_common+=(.conkyrc)
# crontab
files_common+=(.cron.d)
# fetchmail
files_common+=(.fetchmailrc)
# fvwm
files_common+=(.fvwm)
# global
files_common+=(.globalrc)
# smtp
files_common+=(.msmtprc)
# mutt
files_common+=(.mutt .muttrc)
# procmail
files_common+=(.procmailrc)
# proxychains
files_common+=(.proxychains)
# sawfish
files_common+=(.sawfishrc .sawfish)
# stardict
files_common+=(.stardict)
# xmodmap
files_common+=(.xmodmaprc)
# git
files_common+=(.gitconfig)



exit 0
