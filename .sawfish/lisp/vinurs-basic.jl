;;; vinurs-basic.jl --- 

;; Copyright 2012 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)vinurs-basic.jl,v 0.0 2012/03/31 10:42:16 vinurs Exp $
;; Changed: <vinurs 07/13/2012 23:56:16>
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
;;   (require 'vinurs-basic)




;;; Code:

(provide 'vinurs-basic)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 设置win键为super, 这里设置有问题，下面打开以后alt-tab就不能切换窗口了
(custom-set-typed-variable (quote wm-modifier-value) (quote
                                                      (super)) (quote modifier-list))

;; 设置热键锁定屏幕
;; 锁屏并关闭电源
(bind-keys global-keymap "C-Pause"
    '(system "xscreensaver-command -lock & (sleep 2; xset dpms force off) &"))


;; 显示隐藏桌面
(defun my-toggle-show-hide-desktop ()
  "Toggle showing or hiding desktop."
  (interactive)
  (if (showing-desktop-p)
      (hide-desktop)
    (show-desktop)))

(bind-keys global-keymap
           ;; 显示/隐藏桌面
           "Super-d" 'my-toggle-show-hide-desktop
           )


;; 设置声音调节的快捷键，暂时不知道有没有这个需求，按键组合是很宝贵的，先放在这里吧

;;; vinurs-basic.jl ends here
