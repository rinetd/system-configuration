#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)fonts-gen.sh
#
#     Description:  for generate fonts in ~/.fonts
# 
#         Version:  1.0
#         Created:  2013/07/27 09:49:01
#         Changed:  <vinurs 07/27/2013 16:40:12>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##

# needn't use root


sudo mkfontscale 

sudo mkfontdir 

fc-cache -fv 


exit 0
