#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)common-cfg.sh
#
#     Description:  common for mac and linux
# 
#         Version:  1.0
#         Created:  2014/05/05 11:03:38
#         Changed:  <vinurs 03/29/2016 23:06:12>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


# common configuration files

#  NULL
files_common=()
# bin
files_common+=(bin)
# programs
files_common+=(programs)
# work
files_common+=(work)
# baiduyun
files_common+=(baiduyun)


# bash: although i don't use bash, but retain it
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
# ftpd
files_common+=(.ftproot)
# emacs
files_common+=(.emacs .emacs.d)
# crontab
files_common+=(.cron.d)
# global
files_common+=(.globalrc)
# git
files_common+=(.gitconfig .git-ci-msg)
# stardict
files_common+=(.stardict)
# sshfs
files_common+=(sshfs)
# ssh
files_common+=(.ssh)
# gpg
files_common+=(.gnupg)
# astyle
files_common+=(.astylerc)
# mew mail
files_common+=(.Mail-Mew)
# proximac
files_common+=(.proximac)




# files
for i in "${files_common[@]}"; do
    
    # backup
    mv $install_dir/$i ${backup_dir}
    ln -sf  $current_dir/$i $install_dir/

done


# the config files are in .config/ directory
dotconfig_common_array=()


mkdir ${backup_dir}/.config/

# files
for i in "${dotconfig_common_array[@]}"; do

    # backup
    mv $install_dir/.config/$i ${backup_dir}/.config/
    ln -sf $current_dir/.config/$i  $install_dir/.config/

done

# common
# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh


# tmux plugin managet
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

