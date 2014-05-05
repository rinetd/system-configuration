#!/bin/bash 
#==============================================================================
#
#        Filename:  @(#)enca.sh
#
#     Description:  将非UTF-8文件转换为UTF-8格式的文件 
# 
#         Version:  1.0
#         Created:  2012/12/27 16:08:17
#         Changed:  <vinurs 12/28/2012 10:35:48>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##

# 为了简化工具，本脚本只支持中文编码的转换，支持功能
# 1. 提示是否备份原来的文件
# 2. 将一个目录下面的所有文件都转换
# 3. 对单个文件进行转换
# 4. 对一个目录下面的文件进行转换
# 5. 对于无法识别的文件不进行转换，即unknown的文件，最后将这些文件打印出来

# 获得一个目录下面的所有的.c .h文件

function help() {
    :
}

echo -n "will you backup these files [yn]?"
read answer
case $answer in
    y)
        :
        ;;
    n)
        :
        ;;
    *)
        exit 255
        ;;
esac

# get the files
files=$(find ./ -name '*.[ch]')

# backup or no
if [[ "$answer"x = "y"x ]]
then
    # yes
    backup_dir=backup$(date +%H%M%S)
    mkdir $backup_dir
    cp -f $files  $backup_dir
fi  


enca -L zh_CN -x UTF-8 $files
echo "ALL Done"
if [[ "$answer"x = "y"x ]]
then
    echo "all files have been backed up in $backup_dir"
fi


exit 0
