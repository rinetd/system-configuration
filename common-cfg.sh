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
# gdb
files_common+=(.gdbinit)
# vim
files_common+=(.vimrc .vim .viminfo)
# htop
files_common+=(.htoprc)
# indent
files_common+=(.indent.pro)
# lftp
files_common+=(.lftp)
# tor
files_common+=(.tor)
# ftpd
files_common+=(.ftproot)
# emacs
files_common+=(.emacs)
# 这里不会新建一个链接了,开始使用另外一套配置:spacemacs
files_common+=(.emacs.d)
# spacemacs
files_common+=(.spacemacs .spacemacs.d)
# crontab
files_common+=(.cron.d)
# global
files_common+=(.globalrc)
# git
files_common+=(.gitconfig .git-ci-msg .gitignore_global)
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
# mutt
files_common+=(.mutt .muttrc .Mail)
# urlview
files_common+=(.urlview)
# getmail配合mutt收邮件
files_common+=(.getmail)
# 用来取代getmail的
files_common+=(.offlineimaprc)
# .procmailrc对getmail邮件进行分类过滤
files_common+=(.procmailrc .procmail)
# 用msmtp来发送邮件
files_common+=(.msmtprc)
# proximac
files_common+=(.proximac)
# icons
files_common+=(.icons)
# log用来存放一些应用的log目录，这样方便删除
files_common+=(.log)


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

# github common
# system-configuration.wiki
git clone https://github.com/vinurs/system-configuration.wiki.git ~/system-configuration/github/
# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh


# tmux plugin managet
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

