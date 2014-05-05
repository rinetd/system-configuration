#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)install.sh
#
#     Description:  install vinurs in your ~/ 
# 
#         Version:  1.0
#         Created:  2013/09/27 10:02:22
#         Changed:  <vinurs 05/05/2014 11:24:55>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


# 获得系统类型:linux or mac
source system-type.sh


# export system type, so in other shell scripts can use it
echo "****************************************************************"
echo "system type is $system_type ?"
echo "****************************************************************"
# 确认系统类型，如果系统类型猜测得不对，那么立马进行中断
echo -n "It's right?[y/n]:"
read answer
case $answer in
    Y|y)
        echo "the system type is right, continue"
         ;;
    N|n)
        echo  "the system type is not right, cancle"
        exit 0
        ;;
    *)
        echo "unknown choice, quit"
        exit 0
esac

export system_type


# common scripts

sh common.sh

case $system_type in
    linux)
        echo "for linux"
        sh linux.sh
        ;;
    mac)
        sh mac.sh
        echo "for mac"
        ;;
    *)
        ;;
esac

exit 0

# git dir
gitdir="$HOME/vinurs"
origdir="~/"
suffix=`(date '+%Y-%m%d-%H%M%S')`

backupdir="backup-${suffix}"
mkdir ${backupdir}
echo "backup directory is ${backupdir}"

#  NULL
files_array=()
# bash
# 虽然我不用bash，但是还是保留着相关的配置
files_array+=(.bashrc .bash_profile .bash_logout)
# zsh
files_array+=(.zshrc .zshenv .zsh .zprofile .zlogin .zlogout)
# bin
files_array+=(bin)
# tmux
files_array+=(.tmux.conf .tmux)
# vim
files_array+=(.vimrc)
# sbcl
files_array+=(.sbclrc)
# htop
files_array+=(.htoprc)
# indent
files_array+=(.indent.pro)
# lftp
files_array+=(.lftp)
# mailcap
files_array+=(.mailcap)
# emacs
files_array+=(.emacs .emacs.d)
# conky
files_array+=(.conkyrc)
# crontab
files_array+=(.cron.d)
# fetchmail
files_array+=(.fetchmailrc)
# fvwm
files_array+=(.fvwm)
# global
files_array+=(.globalrc)
# smtp
files_array+=(.msmtprc)
# mutt
files_array+=(.mutt .muttrc)
# procmail
files_array+=(.procmailrc)
# proxychains
files_array+=(.proxychains)
# sawfish
files_array+=(.sawfishrc .sawfish)
# stardict
files_array+=(.stardict)
# xmodmap
files_array+=(.xmodmaprc)
# git
files_array+=(.gitconfig)
# xwindow
files_array+=(.Xdefaults)
# fonts
files_array+=(.fonts)
# filezilla
files_array+=(.filezilla)
# virtual-share,跟虚拟机的共享目录
files_array+=(virtual-share)


# files
for i in "${files_array[@]}"; do

    # backup
    mv ~/$i ${backupdir}
    ln -s $gitdir/$i  ~/
    
done


# the config files are in .config/ directory
dotconfig_files_array=()
dotconfig_files_array+=(cairo-dock)
dotconfig_files_array+=(emelfm2)
dotconfig_files_array+=(fbpanel)
dotconfig_files_array+=(tint2)
# 不错的文件管理器
dotconfig_files_array+=(mc)
# fcitx输入法
files_array+=(fcitx)


# files
for i in "${dotconfig_files_array[@]}"; do

    # backup
    mv ~/.config/$i ${backupdir}
    ln -s $gitdir/.config/$i  ~/.config/
    
done




