;;; vinurs-develope.el --- 

;; Copyright 2010 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor_develope.el 0.0 2010/12/07 02:41:20 victor Exp $
;; Changed: <vinurs 08/15/2013 18:52:35>
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
;;   (require 'victor_develope)




;;; Code:

(provide 'victor_develope)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 语法高亮
(global-font-lock-mode t)


;; 自动给你加上括号,包括大括号
(require 'vinurs-electric-pair)

;; 自动给你加上括号,包括大括号
;;(require 'autopair-settings)

;; 用来显示当前光标在哪个函数
(require 'which-func-settings)

;;标准的注释
(load "victor_doxymacs")

;; c语言的配置
(require 'victor-c-settings)


;; 所有代码折叠的配置
(load "victor-code-folding")

;; 动态检查语法错误
;;(require 'victor-flymake-settings)

;; 所有关于括号的配置
;; (require 'victor-paren-settings)


;; 所有的自动补全的配置
(require 'victor-auto-complete-settings)
;; (require 'victor-all-auto-complete-settings)



;;svn的配置
(load "vinurs-svn")

;;fvwm的配置
;; (load "victor-fvwm")

;; 回车后indent
(eal-define-keys
 `(lisp-mode-map emacs-lisp-mode-map lisp-interaction-mode-map sh-mode-map
                 ,(if (not is-before-emacs-21) 'awk-mode-map) java-mode-map
                 ruby-mode-map c-mode-base-map tcl-mode-map org-mode-map
                 python-mode-map perl-mode-map)
 `(("RET" newline-and-indent)))


;; common lisp
;;(require 'vinurs-lisp)


;;; victor_develope.el ends here
