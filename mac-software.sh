#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)mac-software.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2014/05/05 19:27:22
#         Changed:  <vinurs 03/31/2016 20:08:47>
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


# tmux
brew install tmux
brew tap sanemat/font
# for tmux logging
brew install ansifilter
# for tmux copy
brew install reattach-to-user-namespace
brew install mercurial
brew install coreutils
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# aria2，下载神器
brew install aria2
# 配合aria2使用的web页面
git clone https://github.com/ziahamza/webui-aria2.git ~/system-configuration/webui-aria2

# common cmd
brew install gdb
brew install lftp
brew install wget
brew install global
brew install tree
brew install indent
brew install tig
brew install wget
brew install sdcv
brew install cmake


# for common lisp
# 这里不安装sbcl，因为我使用Clozure CL
brew install sbcl
brew install clozure-cl
# lisp结合c来写代码
brew install ecl
brew install buildapp

# ssh-copy-id
brew install ssh-copy-id 

# kindle
brew cask install kindle

brew install --upgrade openssl
brew unlink openssl && brew link openssl --force

# mutt
brew tap sgeb/mutt
# 安装mutt，开启sidebar/trash patch
brew install sgeb/mutt/mutt  --with-confirm-attachment-patch --with-gmail-labels-patch --with-sidebar-patch --with-gmail-server-search-patch --with-trash-patch
brew install offlineimap
brew install msmtp
brew install notmuch
brew install readline
brew install urlview
brew install w3m
brew install lynx
# 配置mutt，使用getmail来下载邮件
brew install getmail
# 用来过滤getmail收到的邮件
brew install procmail
# 邮件客户端
brew install mu


# 终端里面直接打开图片?
# imlib2用来转化图片
brew reinstall libcaca --with-imlib2

brew install perl
# 格式化代码工具
brew install editorconfig
# Node.js
brew install node
brew install nodejs


# python, python libs
brew install python
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

# python3
brew install python3
# librcu
brew install userspace-rcu

# 下载oh-my-zsh
brew install zsh zsh-completions
git clone git://github.com/robbyrussell/oh-my-zsh.git  $HOME/system-configuration/.oh-my-zsh


# htop
brew install htop

# bzr
brew install bzr
brew install autoconf
brew install automake autoconf libtool libxml2 
brew link --force libxml2

brew install minicom
brew install socat


# sshfs
brew install Caskroom/cask/osxfuse
brew install sshfs
brew install homebrew/fuse/sshfs

# gimp gnu画图工具
brew cask install gimp
# sourcetree
brew install Caskroom/cask/sourcetree

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
brew install gpg2

# astyle
brew install astyle
# indent
brew install gnu-indent

# eroxychains
brew install proxychains-ng
brew install libuv


# vim
brew cask install macvim --override-system-vim

# dot画图工具
brew cask install graphviz
#配合graphviz可以生成函数调用图
brew install doxygen --with-dot --with-doxywizard --with-libclang
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


# gpg tools,用来管理gpg，很漂亮
brew install Caskroom/cask/gpgtools

# markdown
brew install markdown

# 通过brew cask安装的软件
# 安装 Google 浏览器，这个不能通过这个安装，1password跟这个安装的不兼容
# brew cask install google-chrome  
brew cask install alfred
brew cask install appcleaner
brew cask install dropbox
brew cask install totalfinder
brew cask install launchrocket
# mac下很不错的中端
brew cask install iterm2

# adium 很好的聊天客户端
brew cask install adium

# emacs
# 删除系统自带的emacs
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus --HEAD --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon
brew linkapps
brew install emacs-clang-complete-async
# ycmd
# clone 

#brew cask install emacs

# 这个不用了，改用1password
#brew cask install lastpass

# qq
brew cask install qq
brew cask install evernote
# java开发环境
brew cask install java
# mac屏保
brew cask install fliqlo
# wireshark
brew cask install xquartz
brew cask install wireshark
brew cask install mplayerx
# sogou
# brew cask install sogouinput
# 工具栏简化工具
brew cask install bartender
# 类似beyondcompare的比较工具,这个我是通过appstore安装的
# brew cask install kaleidoscope
# 用来让kaleidoscope跟git配合使用
brew cask install ksdiff
# 功能最强的比较merge工具，不过就是收费的
brew install Caskroom/cask/araxis-merge

brew cask install zoc

# 用来替代ssh
brew install mobile-shell 

# for tmux urlview
brew install urlview
brew install extract_url

# tmux plugin manager
#curl -Ls ellipsis.sh | PACKAGES='ellipsis-tpm' sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 快捷键提示 
brew cask install cheatsheet

# tor翻墙系列
brew install tor
brew install arm
brew install torsocks
brew cask install torbrowser

# 防止dns污染
brew cask install dnscrypt

# 用iphone解锁mac
brew cask install macid
# 挺好的翻墙软件
brew cask install lantern



