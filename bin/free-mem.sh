#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)free-mem.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2014/02/07 11:35:23
#         Changed:  <vinurs 02/07/2014 11:37:33>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


password=$(cat ~/.rootpasswd)

drop_caches $password

exit 0
