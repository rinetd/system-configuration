;;; vinurs-macro.el --- 

;; Copyright 2012 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-macro.el,v 0.0 2012/06/28 19:39:01 vinurs Exp $
;; Changed: <vinurs 02/26/2016 19:47:41>
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
;;   (require 'vinurs-macro)




;;; Code:

(provide 'vinurs-macro)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################




;; for macros

;; 在当前行的下面新建一个空白行
(fset 'add-newline-after-curline
   [?\C-e return])
;;在当前行的上面新建一个空白行
(fset 'add-newline-before-curline
   [?\C-p ?\C-e return])

;;ctrl + enter 在当前行的下面新建一个空白行
(global-set-key  [(control return)] 'add-newline-after-curline)
;;ctrl + shift + enter 在当前行的上面新建一个空白行
(global-set-key  [(control shift return)] 'add-newline-before-curline)



;;; vinurs-macro.el ends here
