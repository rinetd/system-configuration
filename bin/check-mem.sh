#!/bin/sh
#==============================================================================
#
#        Filename:  @(#)check-mem.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2012/02/24 16:20:09
#	  Changed:  <victor 03/05/2012 16:30:59>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##


ps aux|awk '{print $6 "\t"$11}'|grep -v RSS|sort -n -r > mem-usg-output

less mem-usg-output


exit 0
