#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)getmail.sh
#
#     Description:  get mail for get mail for multiple accounts
# 
#         Version:  1.0
#         Created:  2012/04/11 00:11:02
#         Changed:  <vinurs 05/04/2012 09:51:20>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##

# 防止多次重复调用这个
num=$(ps -ef | grep -e 'getmail ' | grep -v grep | wc -l | grep -o -e '\b[0-9]\b')
if [[ $num -ge 1 ]]; then
    exit
fi


set -e
cd ~/.getmail
rcfiles=""
for file in getmail.* ; do
  rcfiles="$rcfiles --rcfile $file"
done
# -n 表示只收新邮件
exec getmail $rcfiles $@ -n
