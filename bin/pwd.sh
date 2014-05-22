#!/bin/zsh
#==============================================================================
#
#        Filename:  @(#)pwd.sh
#
#     Description:  exec pwd command, copy it to sys clipboard auto
# 
#         Version:  1.0
#         Created:  2013/02/21 09:00:38
#         Changed:  <vinurs 05/06/2014 09:24:06>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##

/bin/pwd
case $system_type in
    Linux)
        /bin/pwd | xclip -i -sel clipboard
        ;;
    mac)
        ;;
    *)
        ;;
esac




