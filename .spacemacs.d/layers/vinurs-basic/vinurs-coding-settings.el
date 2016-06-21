;;; vinurs-coding-settings.el --- 

;; Copyright 2011 vinurs
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-coding-settings.el,v 0.0 2011/02/18 15:05:04 victor Exp $
;; Changed: <vinurs 06/22/2016 07:01:13>
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

(provide 'vinurs-coding-settings)
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





;;; vinurs-coding-settings.el ends here
 
