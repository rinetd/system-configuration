#!/bin/bash
#==============================================================================
#    
#        Filename:  @(#)mac-cfg.sh
#
#     Description:  for mac only
# 
#         Version:  1.0
#         Created:  2014/05/05 11:04:01
#         Changed:  <haiyuan.zhang 06/30/2016 21:00:39>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


chflags nohidden ~/Library/

cp /System/Library/LaunchDaemons/tftp.plist backup_dir
sudo cp -f current_dir/tftp.plist /System/Library/LaunchDaemons/tftp.plist
sudo cp -f current_dir/ftpd.conf /etc/

#  NULL
files_mac=()

files_mac+=(.iterm2)

# files
for i in "${files_mac[@]}"; do

    # backup
    mv $install_dir/$i ${backup_dir}
    ln -sf  $current_dir/$i $install_dir/

done



# the config files are in .config/ directory
dotconfig_mac_array=()
# powerline
dotconfig_mac_array+=(powerline)

# files
for i in "${dotconfig_mac_array[@]}"; do

    # backup
    mv $install_dir/.config/$i ${backup_dir}/.config/
    ln -sf $current_dir/.config/$i  $install_dir/.config/

done

if [ -d "/Volumes/vinurs-sdcard/" ]; then 
	ln -s /Volumes/vinurs-sdcard ~/ 
fi

