;;; vinurs-elget.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-elget.el,v 0.0 2016/07/28 20:41:24 vinurs Exp $
;; Changed: <vinurs 12/13/2016 21:59:47>
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
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.spacemacs.d/el-get/el-get")

;; 每次启动el-get的时候检测el-get是否已经安装，如果没有安装就自动安装
(unless (require 'el-get nil 'noerror)
   (require 'package) 
   (add-to-list 'package-archives
      '("melpa" . "http://melpa.org/packages/")) 
   (package-refresh-contents) 
   (package-initialize) 
   ;; 将el-get安装在.spacemacs.d目录下
   (setq user-emacs-directory "~/.spacemacs.d/") 
   (package-install 'el-get) 
   (require 'el-get)
   ;; 恢复user-emacs-directory
   (setq user-emacs-directory "~/.emacs.d/") 
   )

(add-to-list 'el-get-recipe-path "~/.spacemacs.d/el-get-user/")


;; 我自己需要的一些软件包
(setq my-el-get-packages
   '(
       ;;统计每天的编程时间 
       wakatime-mode

       ;; 代码注释专用
       doxymacs
       
       )
   )


;; 设置一些可选参数
(setq el-get-dir "~/.spacemacs.d/el-get")
(setq el-get-recipe-path-elpa
   "~/.spacemacs.d/el-get/el-get/recipes/elpa/")
(setq el-get-recipe-path-emacswiki
   "~/.spacemacs.d/el-get/el-get/recipes/emacswiki/")
(setq el-get-status-file
   "~/.spacemacs.d/el-get/.status.el")
(setq el-get-user-package-directory
   "~/.spacemacs.d/el-get-init-packages")


(progn
   (setq user-emacs-directory "~/.spacemacs.d/") 
   (el-get 'sync)
   (el-get 'sync my-el-get-packages)
   (setq user-emacs-directory "~/.emacs.d/") 
   ) 

(provide 'vinurs-elget)

;;; vinurs-elget.el ends here
