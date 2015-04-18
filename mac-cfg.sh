#!/bin/bash
#==============================================================================
# 
#        Filename:  @(#)mac-cfg.sh
#
#     Description:  for mac only
# 
#         Version:  1.0
#         Created:  2014/05/05 11:04:01
#         Changed:  <vinurs 04/18/2015 16:17:06>
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


