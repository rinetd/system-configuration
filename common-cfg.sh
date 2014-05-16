#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)common-cfg.sh
#
#     Description:  common for mac and linux
# 
#         Version:  1.0
#         Created:  2014/05/05 11:03:38
#         Changed:  <vinurs 05/07/2014 10:37:21>
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
# filezilla
files_common+=(.filezilla)
# vim
files_common+=(.vimrc .vim .viminfo)
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



# files
for i in "${files_common[@]}"; do
    
    # backup
    mv $install_dir/$i ${backup_dir}
    ln -s  $current_dir/$i $install_dir/

done


# the config files are in .config/ directory
dotconfig_common_array=()
# fcitx输入法
dotconfig_common_array+=(fcitx)
dotconfig_common_array+=(emelfm2)
dotconfig_common_array+=(fbpanel)
dotconfig_common_array+=(mc)


mkdir ${backup_dir}/.config/

# files
for i in "${dotconfig_common_array[@]}"; do

    # backup
    mv $install_dir/.config/$i ${backup_dir}/.config/
    ln -s $current_dir/.config/$i  $install_dir/.config/

done

# common
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh


exit 0
