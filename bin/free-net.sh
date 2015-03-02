#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)free-net.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2012/03/07 17:49:28
#   	  Changed:  <vinurs 03/02/2015 08:28:56>
#        Revision:  none
# 
#          Author:  victor
#           Email:  <haiyuan.victor@gmail.com>
# 
#==============================================================================
##

#/usr/local/newssh/bin/ssh -C -z -Z usassh -D 127.0.0.1:7070 -p 443 user7639@s2.usassh.com
#user7639@s2.usassh.com -p 443  -C -z -Z usassh -D 127.0.0.1:7070
#ssh -Nfx -D 7070 username@s?.usassh.com -Z usassh -p 443 
#/usr/local/newssh/bin/ssh -Nfx -C -z -Z usassh -D 127.0.0.1:7070 -p 443 user7639@s2.usassh.com

user="user7639"

function check-free-net()
{
    # to check that if there has been a ssh on
    ps -ef |grep "ssh -Nfx -C -z -Z usassh -D 127.0.0.1:7070" |grep -v "grep" > /dev/null
    if [[ $? == 0 ]]; then
        # the free-net exist
        echo "the ssh has been on"
        exit 0
    fi
}


# 根据时间的不同，获得8-21之间的随机数
# 用分钟数来进行，
function get_host_num()
{
    # local host_num=$(date +%M)
    # host_num=$(expr $host_num % 13 + 9)
    local host_num
    host_num=$(expr $RANDOM % 14 + 8)
    echo  ${host_num}
}



# 每次检测一下翻墙有没有打开，如果没有打开则自动翻墙，打开了则什么都不做
check-free-net

if [[ "$1" == "-a" ]]; then
    host_num=$(get_host_num)
#    auto-free-net ${host_num}
    auto-free-net 20
    exit 0
fi



function usage()
{
    cat<<EOF
地理位置                 服务器地址          SSH端口
(01)美国                 s1.123ssh.net       22,80,443
(02)新加坡               s2.123ssh.net       22,80,443
(03)越南                 s3.123ssh.net       22,80,443	
(04)美国                 s4.123ssh.net       22,80,443	
(05)日本                 s5.123ssh.net       22,80,443	
(06)新加坡                 s6.123ssh.net       22,80,443	
(07)日本                 s7.123ssh.net       22,80,443
(08)日本                 s8.123ssh.net       22,80,443	
(09)英国                 s9.123ssh.net       22,80,443
(10)美国                 s10.123ssh.net      22,80,443	
(11)美国                 s11.123ssh.net      22,80,443	
(12)美国                 s12.123ssh.net      22,80,443	
(13)日本                 s13.123ssh.net      22,80,443	
(14)日本                 s14.123ssh.net      22,80,443	
(15)韩国                 s15.123ssh.net      22,80,443	
(16)台湾                 s16.123ssh.net      22,80,443	
(17)中国杭州(不能翻墙)   s17.123ssh.net      22,80
(18)香港                 s18.123ssh.net      22,80,443	
(19)台湾                 s19.123ssh.net      22,80,443	
(20)台湾               s20.123ssh.net      22,80,443	
(21)台湾                 s21.123ssh.net      22,80,443
EOF
}

    
# check-free-net
usage
echo -n "please choose one to connect:(10 recommend)"
read choice


#/usr/local/newssh/bin/ssh -Nfx -C -z -Z usassh -D 127.0.0.1:7070 -p 443 user7639@s2.usassh.com


#cmd="/usr/local/newssh/bin/ssh -Nfx -C -z -Z usassh -D 127.0.0.1:7070 -p 443 $user@s$choice.123ssh.net"
cmd="ssh -Nfx -C -z -Z usassh -D 127.0.0.1:7070 -p 443 $user@s$choice.ezlink.hk"
$cmd

# s1.ezlink.hk
