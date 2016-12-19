;;; config.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)config.el,v 0.0 2016/08/16 19:00:47 vinurs Exp $
;; Changed: <vinurs 12/20/2016 07:33:31>
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



;; 设置hlt-highlight-symbol的颜色
(setq hlt-auto-face-backgrounds
  '(
	 "red" "green" "yellow"  "magenta" "cyan"  "DeepPink"
	 "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" 
	 ;; isearch-fail lazy-highlight mode-line mode-line-inactive next-error
	 ;; nobreak-space secondary-selection tooltip trailing-whitespace
	 ;; header-line mode-line-highlight "dark cyan"
	 )
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

;;show the time
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(setq display-time-format "%Y-%m-%d %A %H:%M")

;; 给server-buffers-clients 配置图标
(spacemacs|diminish server-buffer-clients "ⓢ" "S") 

;; hide if
(spacemacs|diminish hide-ifdef-hiding "ℌ" "h") 

(spacemacs|diminish hide-ifdef-mode "ⓗ" "h") 

;;时间 戳设置，设定文档上次保存到信息
;;只要在文档里有里Time-stamp:的设置，就会自动保存时间戳
;;启用time-stamp
(setq time-stamp-active t)
;;去掉time-stamp的警告
(setq time-stamp-warn-inactive t)
;;设置time-stamp的格式
(setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")
;;修改时间戳提示字符
(setq time-stamp-start "Changed:[  \t]+\\\\?[\"<]+")
(setq time-stamp-end: "\n")
;;前15行的时间戳提示符有效
(setq time-stamp-line-limit 15)
;;将修改时间戳的动作添加到保存文件动作里
(add-hook 'write-file-hooks 'time-stamp)


(provide 'config)

;;; config.el ends here
