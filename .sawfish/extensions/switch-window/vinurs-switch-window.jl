;;; vinurs-switch-window.jl ---  

;; Copyright 2012 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-switch-window.jl,v 0.0 2012/03/29 13:14:46 vinurs Exp $
;; Changed: <vinurs 07/14/2012 14:43:20>
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
;;   (require 'victor-switch-window)




;;; Code:

(provide 'victor-switch-window)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; for my own switch window
(setq load-path (cons "~/.sawfish/extensions/switch-window" 
                      load-path))


;; 这个用来搜索当前窗口的
;; (require 'Iswitch-window)
;; 设置iswitch出来的提示窗的背景色以及前景色
;; (setq iswitch-background-color "green")
;; (setq iswitch-foreground-color "black")

;; M-r来直接跳转，用iswitch，但是不能能支持中文搜索，而且不要把下面的窗口给隐藏掉
;; 有了cabinet，这个就没必要启用了
;; (bind-keys global-keymap "M-r" '(iswitch-window-with
;;                                 (lambda (w) (iconify-window w))))


;; 国内大大用的窗口切换脚本，类似iswitch
(require 'cabinet)
(bind-keys global-keymap "W-s" 'cabinet-switch)
;; cabinet颜色设置
(setq cabinet-input-forground (get-color "yellow"))
(setq cabinet-split-line-forground (get-color "red"))
(setq iconified-item-forground (get-color "gray"))
(setq default-item-forground (get-color "white"))
(setq maximized-item-forground (get-color "orange"))
(setq shaded-item-forground (get-color "blue"))
(setq cabinet-background (get-color "DarkGreen"))

;; 移动窗口的各个按键
(require 'start)
(bind-keys global-keymap "w-h" '(cp-move-left (input-focus)))
(bind-keys global-keymap "W-l" '(cp-move-right (input-focus)))
(bind-keys global-keymap "W-k" '(cp-move-top (input-focus)))
(bind-keys global-keymap "W-j" '(cp-move-bottom (input-focus)))
(bind-keys global-keymap "W-u" '(cp-move-top-left (input-focus)))
(bind-keys global-keymap "W-o" '(cp-move-top-right (input-focus)))
(bind-keys global-keymap "W-," '(cp-move-bottom-left (input-focus)))
(bind-keys global-keymap "W-." '(cp-move-bottom-right (input-focus)))
;; (bind-keys global-keymap "W-n" '(cp-maximize (input-focus)))
(bind-keys global-keymap "W-c" '(cp-move-center (input-focus)))
(bind-keys global-keymap "W-Space" '(cp-move-origin-geometry (input-focus)))






;;; victor-switch-window.jl ends here
