#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)mac-software.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2014/05/05 19:27:22
#         Changed:  <vinurs 04/10/2015 08:29:53>
#        Revision:  none
# 
#          Author:  zhanghaiyuan
#           Email:  <zhang.haiyuan@server.embedway.com>
# 
#==============================================================================
##

brew install tmux
brew tap sanemat/font
# for tmux logging
brew install ansifilter
# for tmux copy
brew install reattach-to-user-namespace
# powerline
brew install mercurial
brew install coreutils
brew tap homebrew/dupes
brew install homebrew/dupes/grep


brew install --upgrade openssl
brew unlink openssl && brew link openssl --force


# python libs
easy_install psutil
easy_install mercurial
brew install libgit2
easy_install pygit2
easy_install bzr
easy_install pyuv
pip install i3-py
# pip install powerline-status
mkdir ~/tmp/
cd ~/tmp/; git clone git@github.com:powerline/fonts.git; ./install.sh; cd -;


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
brew install sbcl
# lisp结合c来写代码
brew install ecl
# brew install buildapp

# ssh-copy-id
brew install ssh-copy-id 

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

# for wmctrl
# brew unlink brew-cask
# brew install Caskroom/cask/xquartz
# brew install homebrew/x11/wmctrl

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

# eroxychains
brew install proxychains-ng
brew install libuv

# python
brew install python

brew install macvim --env-std --override-system-vim

# m4
brew install m4

# xcode
brew cask install wwdc

# nvm 
brew install nvm
# set nvm env
source $(brew --prefix nvm)/nvm.sh
nvm install 0.10

# github blog
brew install npm
npm install hexo-cli -g
gem install bundler

source hexo.sh




# markdown
brew install markdown

