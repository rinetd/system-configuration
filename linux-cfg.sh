#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)linux-cfg.sh
#
#     Description:  for linux only
# 
#         Version:  1.0
#         Created:  2014/05/05 11:03:55
#         Changed:  <vinurs 11/06/2014 18:05:25>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


#  NULL
files_linux=()


# conky
files_linux+=(.conkyrc)
files_linux+=(.fetchmailrc)
files_linux+=(.fonts)
files_linux+=(.fvwm)
files_linux+=(.mailcap)
files_linux+=(.msmtprc)
files_linux+=(.mutt .muttrc)
files_linux+=(.procmailrc)
files_linux+=(.proxychains)
files_linux+=(.sawfish .sawfishrc)
files_linux+=(.sbclrc)
files_linux+=(.stardict)
files_linux+=(virtual-share)

files_linux+=(.Xdefaults)
files_linux+=(.xmodmaprc)


# files
for i in "${files_linux[@]}"; do
    
    # backup
    mv $install_dir/$i ${backup_dir}
    ln -s  $current_dir/$i $install_dir/

done


# the config files are in .config/ directory
dotconfig_linux_array=()
# fcitx输入法
dotconfig_linux_array+=(fcitx)
dotconfig_linux_array+=(emelfm2)
dotconfig_linux_array+=(fbpanel)
dotconfig_linux_array+=(mc)


# files
for i in "${dotconfig_linux_array[@]}"; do

    # backup
    mv $install_dir/.config/$i ${backup_dir}/.config/
    ln -s $current_dir/.config/$i  $install_dir/.config/

done

mkdir ~/.Trash


