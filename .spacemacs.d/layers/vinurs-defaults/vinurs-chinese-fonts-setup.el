;;; vinurs-chinese-fonts-setup.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-chinese-fonts-setup.el,v 0.0 2016/10/21 17:09:56 vinurs Exp $
;; Changed: <vinurs 11/30/2016 06:25:10>
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
;;   (require 'vinurs-chinese-fonts-setup)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; cfs配置文件目录
(setq cfs-profiles-directory "~/.spacemacs.d/chinese-fonts-setup/")

;; 维护的多套profile配置文件
(setq cfs-profiles
  '("default"
	 "org-mode"
	 ))


;; 构建 profile 文件所在的目录时，是否考虑当前的 ‘system-type’. 
;; 假设当前系统为 Linux, 当这个选项设置为 t 后，profile1 文件的路径，
;; 将从 ’DIR/profile1.el’ 转为 ’DIR/SYSTEM-TYPE/profile.el’
(setq cfs-use-system-type t)


;; 让 chinese-fonts-setup 随着 emacs 自动生效。
(chinese-fonts-setup-enable) 

;; 定义我自己的字体
(setq cfs-personal-fontnames (list 
							   ;; 中文字体
							   (font-family-list) 
							   ;; 英文字体
							   (font-family-list) 
								;; 不常用汉字
							   (font-family-list) 
							   )) 
;; cfs-personal-fontnames

;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
(cfs-set-spacemacs-fallback-fonts) 

;; 许多用户使用 org-mode 时，习惯让不同的标题，使用的字体大小也不同，这个特性需要用户设置：
(setq cfs-use-face-font-rescale t)



(provide 'vinurs-chinese-fonts-setup)

;;; vinurs-chinese-fonts-setup.el ends here
