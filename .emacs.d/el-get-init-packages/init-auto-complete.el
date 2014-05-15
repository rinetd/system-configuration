;;; init-auto-complete.el --- 

;; Copyright 2014 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-auto-complete.el,v 0.0 2014/05/15 23:11:05 vinurs Exp $
;; Changed: <vinurs 05/16/2014 01:30:41>
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
;;   (require 'init-auto-complete)




;;; Code:

(provide 'init-auto-complete)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")



(require 'auto-complete-config)
(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)


;; 3个字符以后就开始补全
(setq ac-auto-start 3)


;; Show 0.8 second later
(setq ac-auto-show-menu t)
(setq ac-delay 0)




;; Select candidates with C-n/C-p only when completion menu is displayed
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)


;; 7.7. Change a height of completion menu
;; Set ac-menu-height to number of lines.
;; 10 lines,自动补全的下拉窗口出现10行
(setq ac-menu-height 10)



;; 7.9. Ignore case
;; There is three ways to distinguish upper case and lower case.
;; Just ignore case
;; (setq ac-ignore-case t)
;; Ignore case if completion target string doesn't include upper characters
(setq ac-ignore-case 'smart)
;; Distinguish case
;; (setq ac-ignore-case nil)


;; Examples
;; 补全出来的界面的颜色显示设置
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")


;; other configuration









;;; init-auto-complete.el ends here
