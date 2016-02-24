;;; init-company-mode.el --- 

;; Copyright 2016 zhanghaiyuan
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)init-company-mode.el,v 0.0 2016/02/20 12:35:10 vinurs Exp $
;; Changed: <vinurs 02/23/2016 20:48:16>
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
;;   (require 'init-company-mode)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 在所有的buffers里面开启company-mode
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)

;; semantic相关配置
(load "~/.emacs.d/el-get-init-packages/semantic.el")


;; set default `company-backends'
(setq company-backends
      '(
		(
		 company-files          ; files & directory
		 company-abbrev
		 company-dabbrev
         company-keywords       ; keywords
         company-capf
		 company-ispell
         ;; company-yasnippet
		 ;; company-eclim
         )
		 )
	  )

(add-hook 'c-mode-common-hook
		  (lambda ()
			(add-to-list (make-local-variable 'company-backends)
				 '(
				   company-semantic
				   company-c-headers
				   company-gtags				   
				   ))))



(setq company-idle-delay 0)    ; decrease delay before autocompletion popup shows
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
;; 可以根据数字来选择
(setq company-show-numbers t)
;; (setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case t)




;; bigger popup window
(setq company-tooltip-limit 20) 

(setq company-echo-delay 0)     ; remove annoying blinking
;; start autocompletion only after typing
(setq company-begin-commands '(self-insert-command))

(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-h") 'delete-backward-char)

;; 这个貌似目前没什么用，也不知道帮助文档是从哪里来的，也就是show-doc
;; 不过在lisp中倒是有用，在C语言中没看到怎么有用
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)




(provide 'init-company-mode)

;;; init-company-mode.el ends here
