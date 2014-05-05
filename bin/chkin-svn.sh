#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)chkin-svn.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2012/03/05 16:33:09
#	      Changed:  <victor 03/26/2012 21:22:22>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##

# check in my svn codes
. ~/.personal/google-code


# check in my tools
my_svn_ci="svn ci --username ${google_code_user} --password ${google_code_passwd}"


cd ~/bin
svn up
$my_svn_ci -m "check in my tools"; cd


cd ~/.stardict
svn up
$my_svn_ci -m "check in stardict"; cd


# check in crontab file
cd .cron.d
svn up
$my_svn_ci -m "check in crontab files"; cd


# check in files in ~ directory
cd
# svn up
$my_svn_ci -m "check in files in home directory"



exit 0
