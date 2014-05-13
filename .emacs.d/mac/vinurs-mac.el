;;; vinurs-mac.el --- 

;; Copyright 2014 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-mac.el,v 0.0 2014/05/13 22:04:15 vinurs Exp $
;; Changed: <vinurs 05/13/2014 22:19:37>
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
;;   (require 'vinurs-mac)




;;; Code:

(provide 'vinurs-mac)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; key bindings
;; for emacs
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-right-option-modifier 'control)
  (setq mac-right-command-modifier 'meta)
  (setq mac-left-option-modifier 'alt)
  (setq mac-left-command-modifier 'meta)

  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )




;;; vinurs-mac.el ends here
