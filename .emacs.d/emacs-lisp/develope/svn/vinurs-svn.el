;;; vinurs-svn.el --- 

;; Copyright 2010 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor_svn.el 0.0 2010/12/07 02:56:23 victor Exp $
;; Changed: <vinurs 07/05/2012 23:16:57>
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
;;   (require 'victor_svn)




;;; Code:

(provide 'victor_svn)
(eval-when-compile
  (require 'cl))




;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



;; 用psvn来进行svn控制
;; 新的里面修复了提交以后状态不能自动改变的bug
(require 'psvn)


;; 默认新建一个*svn-status* buffer，要不然提交的时候会报出个不痛不痒的错误
(get-buffer-create "*svn-status*")


;; (require 'svn-settings)


;; (defun svn-face-settings ()
;;   "Face settings for `psvn'."
;;   (custom-set-faces
;;    '(svn-status-filename-face
;;      ((((type tty)) :bold t :foreground "yellow")
;;       (t :foreground "yellow")))))

;; (eval-after-load "psvn"
;;   `(svn-face-settings))

;; (global-set-key (kbd "C-x v l") 'vc-print-log)
 
;;; victor-svn.el ends here
