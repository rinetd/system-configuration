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


# my github page
git clone git@github.com:vinurs/vinurs.github.io.git ~/program/vinurs.github.io

# dpdk
git clone git://dpdk.org/dpdk ~/program/dpdk

# dpdk illustration
git clone git@github.com:vinurs/dpdk-src-illustration.git ~/program/dpdk-src-illustration

# linux kernel illustration
git clone git@github.com:vinurs/linux-kernel-illustration.git
exit 0
