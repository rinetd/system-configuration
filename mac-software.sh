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

# 安装brew cask
brew tap caskroom/cask
brew install brew-cask

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

# Node.js
brew install node

# python libs
# for powerline
easy_install psutil
easy_install mercurial
brew install libgit2
easy_install pygit2
easy_install bzr
easy_install pyuv
pip install i3-py
pip install powerline-status
mkdir ~/tmp/
cd ~/tmp/; git clone git@github.com:powerline/fonts.git; ./install.sh; cd -;


brew install zsh zsh-completions
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

brew install doxygen
# 代码静态分析工具
brew install cflow

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

# 通过brew cask安装的软件
# 安装 Google 浏览器
brew cask install google-chrome  
brew cask install alfred
brew cask install appcleaner
brew cask install dropbox
brew cask install totalfinder
brew cask install launchrocket
# mac下很不错的中端
brew cask install iterm2

# emacs
# 删除系统自带的emacs
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs
brew cask install emacs

brew cask install lastpass

# qq
brew cask install qq
brew cask install evernote
# java开发环境
brew cask install java
# mac屏保
brew cask install fliqlo
# wireshark
brew cask install wireshark
brew cask install mplayerx
# sogou
# brew cask install sogouinput
# dot画图工具
#brew cask install graphviz
# 工具栏简化工具
brew cask install bartender
# 类似beyondcompare的比较工具,这个我是通过appstore安装的
# brew cask install kaleidoscope
# 用来让kaleidoscope跟git配合使用
brew cask install ksdiff

brew cask install zoc

# 用来替代ssh
brew install mobile-shell 

# for tmux urlview
brew install urlview
brew install extract_url





