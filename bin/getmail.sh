#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)getmail.sh
#
#     Description:  get mail for get mail for multiple accounts
# 
#         Version:  1.0
#         Created:  2012/04/11 00:11:02
#         Changed:  <vinurs 07/07/2016 23:34:09>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##



function check_new_mail()
{
	file=$1
	account=${file##*getmail\.}
	# echo "$file, $account"
	# 防止同时重复调用这个
	num=$(ps -ef | grep -e 'getmail ' | grep "$file" | wc -l | grep -o -e '\b[0-9]\b')
	if [[ $num -ge 1 ]]; then
		:
	else
		# -n 表示只收新邮件
		result=$(getmail --rcfile $file -n 2>/dev/null | tail -n 1)
		result=${result%%messages*}
		newmail=$(echo "$result" | sed -e 's/^[ \t]*//')
		if [ $newmail -ne 0 ]; then
			terminal-notifier -title "Account: $account" -message "You Got ($newmail) Mails"  -sound default -sender com.apple.Mail
			#say "you got new $newmail mails"
			say "you got new mail"
		fi
	fi
}


set -e
cd ~/.getmail
rcfiles=""
for file in getmail.* ; do
	check_new_mail $file &
done





