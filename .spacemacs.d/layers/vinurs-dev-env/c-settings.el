;;; c-settings.el --- 

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)c-settings.el,v 0.0 2016/05/02 09:11:36 vinurs Exp $
;; Changed: <vinurs 07/27/2016 12:40:41>
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
;;   (require 'c-settings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



;; code style settings
(require 'vinurs-c-code-style) 

;; hide if0,以及快捷键显示隐藏hideif
(require 'vinurs-c-hideif+) 


(provide 'c-settings)

;;; c-settings.el ends here
