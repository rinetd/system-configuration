#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)install.sh
#
#     Description:  install vinurs in your ~/ 
# 
#         Version:  1.0
#         Created:  2013/09/27 10:02:22
#         Changed:  <vinurs 05/05/2014 19:26:51>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##


# 获得系统类型:linux or mac
source bin/system-type.sh


# export system type, so in other shell scripts can use it
echo "****************************************************************"
echo "system type is $system_type ?"
echo "****************************************************************"
# 确认系统类型，如果系统类型猜测得不对，那么立马进行中断
echo -n "It's right?[y/n]:"
read answer
case $answer in
    Y|y)
        echo "the system type is right, continue"
         ;;
    N|n)
        echo  "the system type is not right, cancled"
        exit 0
        ;;
    *)
        echo "unknown choice, quit"
        exit 0
esac

# export system_type

# dirs
# git clone dir
current_dir=`pwd`
echo "current is $current_dir"
# destination dir
install_dir=$HOME
echo "install dir is $install_dir"
# backup dir
suffix=`(date '+%Y-%m%d-%H%M%S')`
backup_dir="backup-${suffix}"
mkdir ${backup_dir}
echo "backup directory is ${backup_dir}"

export current_dir
export install_dir
export backup_dir

# common config files

sh common-cfg.sh

# specific config files
case $system_type in
    linux)
        sh linux-cfg.sh
        ;;
    mac)
        sh mac-cfg.sh
        ;;
    *)
        ;;
esac

# install software
case $system_type in
    linux)
        #sh linux-software.sh
        ;;
    mac)
        #sh mac-software.sh
        ;;
    *)
        ;;
esac




exit 0





