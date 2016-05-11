#!/bin/bash
#==============================================================================
#    
#        Filename:  @(#)mac-cfg.sh
#
#     Description:  for mac only
# 
#         Version:  1.0
#         Created:  2014/05/05 11:04:01
#         Changed:  <vinurs 04/21/2015 22:05:59>
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

if [ -d "/Volumes/Transcend/" ]; then 
   ln -s /Volumes/Transcend/home/Music/网易云音乐 ~/Music
fi

