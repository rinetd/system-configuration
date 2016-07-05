#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)dropbox-files.sh
#
#     Description:  this scripts for link files in Dropbox
# 
#         Version:  1.0
#         Created:  2016/07/06 07:28:31
#         Changed:  <vinurs 07/06/2016 07:53:56>
#        Revision:  none
# 
#          Author:  vinurs
#           Email:  <haiyuan.vinurs@gmail.com>
# 
#==============================================================================
##


# getmail账号文件
if [ -d $HOME/"Dropbox/home/.getmail" ]; then
	ln -s ~/Dropbox/home/.getmail/getmail\.*  ~/.getmail/
fi


if [ -f $HOME/"Dropbox/home/.msmtprc"]; then
	ln -s ~/Dropbox/home/.msmtprc    ~/
fi

exit 0
