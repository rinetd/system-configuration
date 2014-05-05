#!/bin/sh
#==============================================================================
#
#        Filename:  @(#)xmodmap.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2012/03/30 14:11:42
#         Changed:  <vinurs 03/30/2012 14:14:18>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##

if [[ "${1}" == "-o" ]]; then
    # 如果已经执行过一次xmodmap .xmodmaprc,那么什么都不干；否则执行一次进行键映射
    if
        xmodmap | grep "lock" | grep "0x42" &> /dev/null
    then
        xmodmap ~/.xmodmaprc
    fi

    exit 0
fi

xmodmap ~/.xmodmaprc




exit 0
