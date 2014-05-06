#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)common.sh
#
#     Description:  common for mac and linux
# 
#         Version:  1.0
#         Created:  2014/05/05 11:03:38
#         Changed:  <vinurs 05/05/2014 19:02:23>
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
# htop
files_common+=(.htoprc)
# indent
files_common+=(.indent.pro)
# lftp
files_common+=(.lftp)
# emacs
files_common+=(.emacs .emacs.d)
# crontab
files_common+=(.cron.d)
# global
files_common+=(.globalrc)
# git
files_common+=(.gitconfig)

# echo "*************************"
 echo $current_dir
 echo $install_dir
 echo $backup_dir
# echo "*************************"


# files
for i in "${files_common[@]}"; do
    
    # backup
    echo "i is $i"
    mv $install_dir/$i ${backup_dir}
    echo ln -s $current_dir/$i  $install_dir/
    #ln -s $current_dir/$i $install_dir/
    ln -s $current_dir/$i ~/

done


# the config files are in .config/ directory
dotconfig_common_array=()
# # fcitx输入法
# files_array+=(fcitx)


# files
for i in "${dotconfig_files_array[@]}"; do

    # backup
    mv $install_dir/.config/$i ${backup_dir}
    ln -s $current_dir/.config/$i  $install_dir/.config/

done



exit 0
