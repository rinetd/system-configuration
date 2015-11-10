#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)stock-gen.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2015/11/10 08:38:43
#         Changed:  <vinurs 11/10/2015 14:10:20>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##




# 目前已经产生的组号
array=( 1  3  4  5  2)



# 对第几组起作用
arrayNo=0

# 判断今天是否是周一的变量
weekday=`date`
weekday=`echo $weekday |cut -c 1-3`


# 如果今天是周一，那么清空did_weekday数组
if [ "$weekday" == "Mon" ]; then
	# 同时清空did_weekday数组
	array=()
fi


while true
do
	# arrayNo=`expr($RANDOM%5+1)`
	arrayNo=$(($RANDOM%5+1))

	# 判断数组是否为空
	num=${#array[@]}
	newarray=""
	# 如果已经计算过五次了，那么直接退出
	if [ $num == 5 ]; then
		echo "已经计算过五次了,请仔细执行该脚本"
		exit
	fi

	if [ $num != 0 ]; then

		# 判断数组里面是否已经存在了这个组
		newarray="array=("
		for data in ${array[@]}  
		do
			if [ $arrayNo == $data ]; then
				arrayNo=0
				break
			else
				newarray="$newarray $data "
			fi

		done
		
		newarray="$newarray $arrayNo)"
	else
		newarray="array=($arrayNo)"
		# echo $newarray
	fi


	
	if [ $arrayNo != 0 ]; then
		# 修改笨文件的某一行,构建这个字符串
		sed -i '' "s/^array=(.*$/$(echo "$newarray")/g" ~/bin/stock-gen.sh
		break

	else
		continue
	fi

done

# 输出今天买第几组
echo "newarray is "$newarray
echo "今天买第 $arrayNo 组"

exit 0
