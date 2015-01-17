;;; vinurs-pre-basic.el --- 

;; Copyright 2015 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-pre-basic.el,v 0.0 2015/01/17 00:56:05 vinurs Exp $
;; Changed: <vinurs 01/17/2015 10:06:59>
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
;;   (require 'vinurs-pre-basic)




;;; Code:

(provide 'vinurs-pre-basic)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; functions that shoud define before basic files loaded


;; 加载一个目录下面的所有目录到load-path里面的函数
;; 该函数摘抄自网络
(load "~/.emacs.d/emacs-lisp/basic/add-subdirs.el")

;; 把要加载的文件的路径全部加载进去
(load "~/.emacs.d/emacs-lisp/basic/vinurs-load-path.el")








;;; vinurs-pre-basic.el ends here
