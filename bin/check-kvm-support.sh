#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)check-kvm-support.sh
#
#     Description:  check if your cpu supports KVM, 如果flags: 里有vmx 或者svm就说明支持VT；如果没有任何的输出，说明你的cpu不支持，将无法成功安装KVM虚拟机。
# 
#         Version:  1.0
#         Created:  2013/11/07 09:23:07
#         Changed:  <vinurs 11/07/2013 09:24:06>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


egrep '(vmx|svm)' /proc/cpuinfo

exit 0
