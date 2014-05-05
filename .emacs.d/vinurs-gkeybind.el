;;; vinurs-gkeybind.el --- 

;; Copyright 2012 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-gkeybind.el,v 0.0 2012/06/28 19:36:17 vinurs Exp $
;; Changed: <vinurs 06/28/2012 19:36:31>
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
;;   (require 'vinurs-gkeybind)




;;; Code:

(provide 'vinurs-gkeybind)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; for all gkeybind
;; load the end

;;goto line
(global-set-key (kbd "C-j") 'goto-line)


;; 定义C-c m 打开man文档
(global-set-key (kbd "C-c m") 'manual-entry)

;; C-;就显示一个窗口
;; 这个是在X下面使用的
(global-set-key (kbd "C-;") 'delete-other-windows)
;; 这个在terminal下面使用
(global-set-key [(control semicolon)] 'delete-other-windows)

;; C-o 跳转到另外一个窗口
(global-set-key (kbd "C-o") 'other-window)



;;; vinurs-gkeybind.el ends here