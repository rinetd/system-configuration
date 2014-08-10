;;; init-slime.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-slime.el,v 0.0 2013/08/15 20:23:39 vinurs Exp $
;; Changed: <vinurs 08/11/2014 07:38:28>
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
;;   (require 'init-slime)




;;; Code:

(provide 'init-slime)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(if (eq system-type 'darwin)
    (setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
  (setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
    )


(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
;; (add-to-list 'load-path "~/hacking/lisp/slime/")  ; your SLIME directory

;; (slime-setup)
(slime-setup '(slime-repl))


(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
      (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))


;;; init-slime.el ends here
