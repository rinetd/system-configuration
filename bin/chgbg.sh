#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)chgbg.sh
#
#     Description:  change the backgroud imgage 
# 
#         Version:  1.0
#         Created:  2012/03/29 19:11:55
#         Changed:  <vinurs 01/21/2014 21:11:15>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##

img_path=/home/vinurs/.sawfish/images/bg/
postfixs=(jpg png)
wallpapers=()

# 遍历数组得到所有存在的背景
# 得到所有背景的个数，然后定义random的值
# 获得random的值，然后取数组中对应的图盘来作为背景

cd $img_path
for class_pic in "${postfixs[@]}"; do
    for pic in $(ls *.$class_pic); do
        wallpapers+=($pic)
    done
done

# get all wallpapers num
length=${#wallpapers[@]}


if [[ $length -eq 0 ]]; then
    exit
fi

# get random
((change_pic=$RANDOM%(length)))


# 以后加上对在哪个X上面的处理
display=

# now=$(expr $now % ${mod})
# # xloadimage -onroot -fullscreen -display :0 ${img_path}/${now}.jpg 1>/dev/null 2>&1
# feh --bg-scale ${img_path}/${now}.jpg 1>/dev/null 2>&1  

feh --bg-scale ${img_path}/${wallpapers[$change_pic]} 1>/dev/null 2>&1


exit 0
