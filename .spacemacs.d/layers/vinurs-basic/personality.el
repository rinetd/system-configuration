;;; personality.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)personality.el,v 0.0 2011/02/18 12:08:13 victor Exp $
;; Changed: <vinurs 06/30/2016 08:39:44>
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
;;   (require 'personality)




;;; Code:

(provide 'personality)
(eval-when-compile
	(require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 个人相关信息的配置
;;set my fullname and my email,they can be used when mailing
;; default user-full-name and mail
(setq user-full-name "zhanghaiyuan")
(setq user-mail-address "haiyuan.vinurs@gmail.com") 

;; 有时候我们需要用到多个邮箱，比如自己的项目用自己的私人邮箱，
;; 公司的项目用公司的邮箱，这时候一般文件头部的邮箱信息就需要改变，这里定义函数自动改变
(defconst private-user-full-name "vinurs")
(defconst private-user-mail-address "haiyuan.vinurs@gmail.com")
(defconst company-user-full-name "haiyuan.zhang")
(defconst company-user-mail-address "haiyuan.zhang@kaixiangtech.com")

(defconst vinurs-info-list '(("^/Users/vinurs/work" "haiyuan.zhang"  "haiyuan.zhang@kaixiangtech.com")
								;; this must be the last, this is albe default
								(nil "vinurs" "haiyuan.vinurs@gmail.com")
								)) 

;; user-full-name and user-mail-address will set to different when in different directory
(defun __change-user-info (dir infolist)
	"change the user info by dir"
	(while infolist
		(let ((tmpdir (car (car infolist)))
				 (tmpfullname (second (car infolist)))
				 (tmpmail (third (car infolist)))
				 )
			(if (null tmpdir)
				(progn
					(setq user-full-name tmpfullname)
					(setq user-mail-address tmpmail) 
					(setq time-stamp-format (concat user-full-name " %02m/%02d/%04y %02H:%02M:%02S"))
					)
				(if (string-match tmpdir dir)
					;; match
					(progn
						(setq user-full-name tmpfullname)
						(setq user-mail-address tmpmail) 
						(setq infolist nil)
						(setq time-stamp-format (concat user-full-name " %02m/%02d/%04y %02H:%02M:%02S"))
						)
					;; do not match
					)
				)
			)
		(setq infolist (cdr infolist))
		)
	) 


(defun change-user-info ()
	(__change-user-info buffer-file-name vinurs-info-list)) 
(add-hook 'find-file-hook 'change-user-info) 


(setq-default default-directory "~")



;;; personality.el ends here
