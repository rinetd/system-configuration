;;; vinurs-elget.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-elget.el,v 0.0 2016/07/28 20:41:24 vinurs Exp $
;; Changed: <vinurs 08/16/2016 19:57:48>
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'vinurs-elget)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 设置el-get的init-packages路径
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.spacemacs.d/el-get-init-packages")


;; 每次启动el-get的时候检测el-get是否已经安装，如果没有安装就自动安装
(unless (require 'el-get nil 'noerror)
  (require 'package) 
  (add-to-list 'package-archives
	'("melpa" . "http://melpa.org/packages/")) 
  (package-refresh-contents) 
  (package-initialize) 
  (package-install 'el-get) 
  (require 'el-get)) 
 
(add-to-list 'el-get-recipe-path "~/.spacemacs.d/el-get-user/")


;; 我自己需要的一些软件包
(setq my-el-get-packages
      '(
		 ;;统计每天的编程时间 
		 wakatime-mode
        )
	  
      )


(el-get 'sync)

(el-get 'sync my-el-get-packages)

(provide 'vinurs-elget)

;;; vinurs-elget.el ends here
