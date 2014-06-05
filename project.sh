#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)project.sh
#
#     Description:  clone  some projects
# 
#         Version:  1.0
#         Created:  2014/05/22 16:31:28
#         Changed:  <vinurs 05/22/2014 16:36:24>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


cd ~/program
# my github page
git clone git@github.com:vinurs/vinurs.github.io.git 

# dpdk
git clone git://dpdk.org/dpdk 

# dpdk illustration
git clone git@github.com:vinurs/dpdk-src-illustration.git 

# linux kernel illustration
git clone git@github.com:vinurs/linux-kernel-illustration.git

# my c library
git clone git@github.com:vinurs/c-lib.git

# UNPv1
git clone git@github.com:vinurs/UNPv1.git

# UNPv2
git clone git@github.com:vinurs/UNPv2.git

# libev
git clone git@github.com:vinurs/libev-src.git

exit 0
