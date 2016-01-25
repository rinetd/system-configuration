;;; init-ace-window.el --- 

;; Copyright 2016 zhanghaiyuan
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)init-ace-window.el,v 0.0 2016/01/23 21:40:53 vinurs Exp $
;; Changed: <vinurs 01/23/2016 22:45:44>
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
;;   (require 'init-ace-window)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(global-set-key (kbd "C-o") 'ace-window)
;; 不希望切换窗口的时候全部变成灰色，希望保持原来的颜色
(setq aw-background nil)
;; 这个不明白什么意思
(setq ace-window-display-mode t)
;; (defface aw-background-face
;;   '((t (:foreground "blue")
;; 	   ))
;;   "Face for whole window background during selection.")

;; (defface aw-leading-char-face
;;   '((((class color)) (:foreground "red"
;; 								  ;; :background "blue"
;; 								  ;; :height 500
;; 								  ))
;; 	(((background dark)) (:foreground "gray100"))
;; 	(((background light)) (:foreground "gray0"))
;; 	(t (:foreground "gray100" :underline nil)))
;;   "Face for each window's leading char.")

;; (:background "red" :foreground "black")
;; (set-face-attribute 'aw-leading-char-face nil :height 400)

;; (setq aw-background nil)
(provide 'init-ace-window)

;;; init-ace-window.el ends here
