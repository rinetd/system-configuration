#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)global.sh
#
#     Description:  for global
# 
#         Version:  1.0
#         Created:  2012/08/15 22:23:32
#         Changed:  <vinurs 08/15/2012 23:04:12>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


ln -s /usr/include ~/.global/usr_include >/dev/null 2>&1
ln -s /usr/local/include ~/.global/usr_local_include >/dev/null 2>&1

cd ~/.global
gtags -i


exit 0
