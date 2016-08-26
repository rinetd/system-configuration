;;; config.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)config.el,v 0.0 2016/08/16 19:00:47 vinurs Exp $
;; Changed: <vinurs 08/26/2016 16:56:46>
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
;;   (require 'config)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; add to load-path first
(push "~/.spacemacs.d/layers/vinurs-defaults/" load-path)

;; Prefixes
;; 除了spacemac自定义的前缀键，我自己另外定义了oa表示我自己的应用程序
(setq spacemacs/key-binding-prefixes '(("o"   "user-defineds")
										("oa"  "applications")
										))
(mapc (lambda (x) (apply #'spacemacs/declare-prefix x))
  spacemacs/key-binding-prefixes)



;; 设置hlt-highlight-symbol的颜色
(setq hlt-auto-face-backgrounds
  '("red" "green" "yellow" "blue" "magenta" "cyan"  "DeepPink"
	 "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" isearch
	 isearch-fail lazy-highlight mode-line mode-line-inactive next-error
	 nobreak-space secondary-selection tooltip trailing-whitespace
	 header-line mode-line-highlight "dark cyan" )
  ) 

;; 一行太长的时候自动换行
(setq truncate-lines t)
;; 不显示工具栏，碍眼
(tool-bar-mode -1)

;;;设置标题栏显示文件的完整路径名
(setq frame-title-format
  '("vinurs@知行合一^-^--PATH:%S" (buffer-file-name "%f"
									(dired-directory dired-directory "%b")))) 

;; 屏幕滚动更加平滑
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; two lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; 编码设置:utf-8之类，所有的文件全部以utf8保存
(require 'vinurs-coding-settings) 



(provide 'config)

;;; config.el ends here
