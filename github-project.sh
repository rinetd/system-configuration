#!/bin/bash
#==============================================================================
#
#        Filename:  @(#)github-project.sh
#
#     Description:  
# 
#         Version:  1.0
#         Created:  2016/08/03 18:36:29
#         Changed:  <vinurs 08/03/2016 19:54:39>
#        Revision:  none
# 
#          Author:  haiyuan.zhang
#           Email:  <haiyuan.vinurs@gmail.com>
# 
#==============================================================================
##

# download project from github into github project
github_dir=~/system-configuration/github/
cd $github_dir

# 系统配置文件的wiki
git clone https://github.com/vinurs/system-configuration.wiki.git

# my website
git clone https://github.com/vinurs/website.git
# 个人blog的主题
git clone https://github.com/vinurs/hexo-theme-yelee.git website/themes/yelee
# 用org-mode来配合hexo写blog
git clone https://github.com/vinurs/hexo-renderer-org.git
# 支持文章置顶
git clone https://github.com/vinurs/hexo-generator-index.git

# aria2的浏览器插件，可以在浏览器里面查看aria2下载的情况
git clone https://github.com/ziahamza/webui-aria2.git




cd -

