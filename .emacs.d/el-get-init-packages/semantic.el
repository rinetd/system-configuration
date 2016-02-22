;;; semantic.el --- 

;; Copyright 2016 zhanghaiyuan
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)semantic.el,v 0.0 2016/02/21 14:34:34 vinurs Exp $
;; Changed: <vinurs 02/21/2016 17:33:39>
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
;;   (require 'semantic)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;;;;#########################################################################
;; semantic相关配置
;; 默认开始semantic-mode

(setq semantic-default-submodes '(
								  ;; idle scheduler
								  global-semantic-idle-scheduler-mode
								  ;; semanticdb
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
								  global-semantic-idle-completions-mode
								  ;; 高亮当前的函数名
								  ;; global-semantic-highlight-func-mode
								  ;; (see Tag Decoration Mode).
								  ;; global-semantic-decoration-mode
								  ;; (see Sticky Func Mode).
								  ;; 这个会在buffer的最上面一行现实函数名字
								  ;; global-semantic-stickyfunc-mode
								  ;; (see MRU Bookmarks).
								  ;; global-semantic-mru-bookmark-mode 
								  ))
;; 根据上面的default-submodes来开启semantic的一些mode
(semantic-mode 1)

(setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")

;; 避免semantic占用CPU过多,单位second 
(setq-default semantic-idle-scheduler-idle-time 600) 

;; 设置被高亮的函数的颜色
(set-face-attribute 'semantic-highlight-func-current-tag-face nil
					:background "cyan1" :foreground "gray0")


;; (global-semantic-idle-summary-mode 0)
;; (semantic-load-enable-code-helpers)
;;;;#########################################################################




(provide 'semantic)

;;; semantic.el ends here
