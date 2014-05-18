;;; init-highlight-symbol.el --- 

;; Copyright 2014 vinurs
;;
;; Author: vinurs@localhost.localdomain
;; Version: $Id: @(#)init-highlight-symbol.el,v 0.0 2014/05/18 12:32:07 vinurs Exp $
;; Changed: <vinurs 05/18/2014 12:32:33>
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
;;   (require 'init-highlight-symbol)




;;; Code:

(provide 'init-highlight-symbol)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



(add-hook 'find-file-hooks 'highlight-hooks)
(defun highlight-hooks()  
  (setq highlight-symbol-idle-delay 0.5)  
  (highlight-symbol-mode 1))  

(global-set-key (kbd "C-c l s") 'highlight-symbol-at-point)
(global-set-key [double-mouse-1] 'highlight-symbol-at-point)

;; remove all highlight
(global-set-key (kbd "C-c l r") 'highlight-symbol-remove-all)

(global-set-key (kbd "C-c l p") 'highlight-symbol-prev)
(global-set-key (kbd "C-c l n") 'highlight-symbol-next)


;;; init-highlight-symbol.el ends here
