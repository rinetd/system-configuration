;;; vinurs-coding-settings.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-coding-settings.el,v 0.0 2011/02/18 15:05:04 victor Exp $
;; Changed: <vinurs 11/25/2014 16:59:07>
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
;;   (require 'victor-coding-settings)




;;; Code:

(provide 'victor-coding-settings)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################




;; 设置默认编码
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;设置默认读入文件编码
(prefer-coding-system 'utf-8)
(prefer-coding-system 'gb2312)
;;设置写入文件编码
(setq default-buffer-file-coding-system 'utf-8)

;; 如果不写下面两句，只写
(prefer-coding-system 'utf-8)
;; 这一句的话，新建文件以utf-8编码，行末结束符平台相关
(prefer-coding-system 'utf-8-dos)
(prefer-coding-system 'utf-8-unix)


(defun revert-buffer-no-confirm ()
  "执行`revert-buffer'时不需要确认"
  (interactive)
  (when (buffer-file-name)
	(revert-buffer buffer-file-name t)
    ))

(defun revert-buffer-with-coding-system-no-confirm (coding-system)
  "Call `revert-buffer-with-coding-system', but when `revert-buffer' do not need confirm."
  (interactive "zCoding system for visited file (default nil): ")
  (let ((coding-system-for-read coding-system))
    (revert-buffer-no-confirm)))

(defun revert-buffer-with-gbk ()
  "Call `revert-buffer-with-coding-system-no-confirm' with gbk."
  (interactive)
  (revert-buffer-with-coding-system-no-confirm 'gbk))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x u"   revert-buffer-no-confirm)
;;    ("C-x M-K" revert-buffer-with-gbk)
;;    ("C-x U"   revert-buffer-with-coding-system-no-confirm-sb)))




;;; victor-coding-settings.el ends here
 
