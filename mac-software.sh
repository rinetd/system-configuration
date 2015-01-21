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
# 这里不安装sbcl，因为我使用Clozure CL
# brew install sbcl

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
brew install Caskroom/cask/osxfuse
brew install sshfs

# for w3m for emacs
brew install libatomic_ops
brew install w3m
brew install cvs

# for music
brew install mpg123


# stunnel
brew install stunnel

# tcpreplay
brew install tcpreplay

# ruby
brew install ruby


# texinfo
brew install texinfo

# gpg
brew install gpg

# astyle
brew install astyle
# indent
brew install gnu-indent

# python
brew install python

# nvm 
brew install nvm
# set nvm env
source $(brew --prefix nvm)/nvm.sh
nvm install 0.10

# github blog
brew install npm
npm install -g hexo
gem install bundler

# markdown
brew install markdown

