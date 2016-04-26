#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)aria.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2016/04/26 18:37:13
#         Changed:  <vinurs 04/26/2016 18:40:59>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <haiyuan.vinurs@gmail.com>
# 
#==============================================================================
##

# check if aria has been turned on
ps -ef |grep aria2c | grep -v grep >/dev/null 2>&1
if [ $? -ne 0 ]; then
	(aria2c  >/dev/null 2>&1 &)
fi


exit 0
