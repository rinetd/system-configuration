;;; c-settings.el --- 

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)c-settings.el,v 0.0 2016/05/02 09:11:36 vinurs Exp $
;; Changed: <vinurs 12/07/2016 17:43:49>
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
;;   (require 'c-settings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; code style settings
(require 'vinurs-c-code-style) 

;; hide if0,以及快捷键显示隐藏hideif
(require 'vinurs-c-hideif+) 

;; gtags/helm-gtags针对C语言的设置
(require 'gtags-c-mode) 

;; ycmd
;; (require 'vinurs-ycmd) 


(setq vinurs-spacemacs/key-binding-prefixes
  '(
	 ("mm"   "Macro")
	 )) 
(mapc (lambda (x) (apply #'spacemacs/declare-prefix x))
	vinurs-spacemacs/key-binding-prefixes) 

;; 给一段宏后面增加反斜杠
(spacemacs/set-leader-keys-for-major-mode 'c-mode
  "m s" 'c-backslash-region) 
;; 给一段宏后面移反斜杠
(spacemacs/set-leader-keys-for-major-mode 'c-mode
  "m r" (defun remove-c-backslash () (interactive)
		  (setq current-prefix-arg '(4)) ; C-u
		  (call-interactively 'c-backslash-region))
  ) 


(provide 'c-settings)

;;; c-settings.el ends here
