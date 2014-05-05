#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)system-type.sh
#
#     Description:  get system type
# 
#         Version:  1.0
#         Created:  2014/05/05 11:18:40
#         Changed:  <vinurs 05/05/2014 11:23:20>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##



# 获得系统类型:linux or mac

uname -a | grep 'GNU/Linux' >/dev/null
if [[ $? != 0 ]]; then
    system_type=mac
else
    system_type=linux
fi

export system_type



