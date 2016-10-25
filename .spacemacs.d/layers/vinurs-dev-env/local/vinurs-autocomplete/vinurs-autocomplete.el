;;; vinurs-autocomplete.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-autocomplete.el,v 0.0 2016/10/25 20:07:06 vinurs Exp $
;; Changed: <vinurs 10/25/2016 20:18:14>
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
;;   (require 'vinurs-autocomplete)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 全局打开自动补全
(global-company-mode) 


;; 增加自动补全的快捷键设置

(provide 'vinurs-autocomplete)

;;; vinurs-autocomplete.el ends here
