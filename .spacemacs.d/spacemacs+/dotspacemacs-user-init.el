;;; dotspacemacs-user-init.el --- 

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)dotspacemacs-layers.el,v 0.0 2016/05/25 15:13:53 vinurs Exp $
;; Changed: <vinurs 09/13/2016 08:31:12>
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
;;   (require 'dotspacemacs-user-init)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; "Initialization function for user code.
;; It is called immediately after `dotspacemacs/init', before layer configuration
;; executes.
;;  This function is mostly useful for variables that need to be set
;; before packages are loaded. If you are unsure, you should try in setting them in
;; `dotspacemacs/user-config' first."
 
(setq exec-path-from-shell-arguments '("-l"))

;; 配置path环境变量
(setenv "PATH" (concat "/usr/local/bin/:" (getenv "PATH"))) 
(setq exec-path (append exec-path '("/usr/local/bin/")))
(setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex"))) 
;; (setq org-export-latex-inputenc-alist '(("utf8" "utf8x"))) 
;; (require 'ox-latex) 
;; (setq org-latex-default-packages-alist (cons '("mathletters" "ucs" nil) org-latex-default-packages-alist)) 


(provide 'dotspacemacs-user-init)

;;; dotspacemacs-user-init.el ends here
