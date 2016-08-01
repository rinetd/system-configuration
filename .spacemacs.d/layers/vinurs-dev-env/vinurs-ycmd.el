;;; vinurs-ycmd.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-ycmd.el,v 0.0 2016/08/01 04:10:10 vinurs Exp $
;; Changed: <vinurs 08/01/2016 04:50:21>
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
;;   (require 'vinurs-ycmd)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command '("python" "/Users/vinurs/system-configuration/github/ycmd/ycmd/")) 


;; (with-eval-after-load 'ycmd


;;   ;; (set-variable 'ycmd-global-config "/path/to/global_config.py")

   
;;   ) 




(provide 'vinurs-ycmd)

;;; vinurs-ycmd.el ends here
