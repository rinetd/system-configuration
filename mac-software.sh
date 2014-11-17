#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)mac-software.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2014/05/05 19:27:22
#         Changed:  <vinurs 11/17/2014 20:02:36>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##

brew install tmux
# for tmux copy
brew install reattach-to-user-namespace

brew install zsh
brew install lftp
brew install wget
brew install global

# htop
brew install htop
sudo chown root:wheel /usr/local/bin/htop
sudo chmod u+s /usr/local/bin/htop 

brew install indent
# for common lisp
brew install sbcl
# for git log
brew install tig
# wget
brew install wget
# bzr
brew install bzr
brew install autoconf
brew install automake autoconf libtool libxml2 
brew link --force libxml2

brew install minicom
brew install socat

# cmeake
brew install cmake
# sdcv for stardict
brew install sdcv

# sshfs
brew install sshfs

# tcpreplay
brew install tcpreplay

# ruby
brew install ruby


# texinfo
brew install texinfo

# gpg
brew install gpg

# github blog
brew install npm
npm install -g hexo
