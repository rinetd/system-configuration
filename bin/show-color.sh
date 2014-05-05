#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)show-color.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2012/08/14 20:14:09
#         Changed:  <vinurs 08/14/2012 20:14:15>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
done


exit 0
