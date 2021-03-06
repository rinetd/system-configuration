#!/bin/bash
#==============================================================================
# 
#        Filename:  @(#)install.sh
#
#     Description:  install vinurs in your ~/
# 
#         Version:  1.0
#         Created:  2013/09/27 10:02:22
#         Changed:  <vinurs 08/03/2016 19:11:27>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@gmail.com>
# 
#==============================================================================
##

# 加载环境变量
source env.rc 

# 获得系统类型:linux or mac
export system_type=$(uname)

# 获得系统主系列:Linux/Mac
export system_major=$(uname)
# Linux系统次系列:rpm/deb，mac不需要这个
system_minor=$(uname -a)
[[ $system_minor =~ "Ubuntu" ]] && system_minor="deb"
[[ $system_minor =~ "Fedora" ]] && system_minor="rpm"
export system_minor

# echo $system_minor


exit 0


# export system type, so in other shell scripts can use it
echo "****************************************************************"
echo "system type is $system_type:$system_minor ?"
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
        exit 1
        ;;
    *)
        echo "unknown choice, quit"
        exit 1
esac



# sudo begin:这里为了全程只输入一次sudo密码
sudo touch /tmp/tmp
sudo rm -f /tmp/tmp

# dirs for backup and install
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
    Linux)
        sh fedora-cfg.sh
        ;;
    Darwin)
        sh mac-cfg.sh
        ;;
    *)
        ;;
esac

# install software
case $system_type in
    Linux)
        sh fedora-software.sh
        ;;
    Darwin)
        sh mac-software.sh
        ;;
    *)
        ;;
esac

# restore .ssh files
if [ -d ${backup_dir}/.ssh ]; then
    cp -rf ${backup_dir}/.ssh/*  ~/.ssh/
fi


exit 0





