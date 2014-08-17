#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)project.sh
#
#     Description:  clone  some projects
# 
#         Version:  1.0
#         Created:  2014/05/22 16:31:28
#         Changed:  <vinurs 06/11/2014 07:54:16>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##

# 这个是在新分支上面修改的
# 第一次修改
# 第二次修改
# 第三次修改

cd ~/program
# my github page
git clone git@github.com:vinurs/vinurs.github.io.git 

# dpdk
git clone git://dpdk.org/dpdk 


# dpdk illustration
git clone git@github.com:vinurs/dpdk-src-illustration.git 
git clone git@github.com:vinurs/dpdk-src-illustration.wiki.git

# linux kernel illustration
git clone git@github.com:vinurs/linux-kernel-illustration.git
git clone git@github.com:vinurs/linux-kernel-illustration.wiki.git


# datastruct
git clone git@github.com:vinurs/datastruct.git

# UNPv1
git clone git@github.com:vinurs/UNPv1.git

# UNPv2
git clone git@github.com:vinurs/UNPv2.git

# libev
git clone git@github.com:vinurs/libev-src.git

# Makefile test
git clone git@github.com:vinurs/Makefile.git

# my lib
git clone git@github.com:vinurs/vinurs-libs.git

# jemalloc
git clone git@github.com:vinurs/jemalloc-illustrate.git

# lisp
git clone git@github.com:vinurs/lisp.git

exit 0
