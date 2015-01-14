;;; vinurs-astyle.el --- 

;; Copyright 2015 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-astyle.el,v 0.0 2015/01/14 08:33:05 vinurs Exp $
;; Changed: <vinurs 01/14/2015 08:45:07>
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
;;   (require 'vinurs-astyle)




;;; Code:

(provide 'vinurs-astyle)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; astyle
(load "astyle-hooks.el")

(defun astyle-this-buffer (pmin pmax)
  (interactive "r")
  (shell-command-on-region pmin pmax
                           "astyle " ;; add options here...
                           (current-buffer) t 
                           (get-buffer-create "*Astyle Errors*") t))

(defvar astyle-command "astyle --style=ansi --mode=c") 

(defun astyle-region (start end) 
  "Run astyle on region, formatting it in a pleasant way." 
  (interactive "r") 
  (save-excursion 
    (shell-command-on-region start end astyle-command nil t) 
    ) 
  ) 

(defun astyle-buffer () 
  "Run astyle on whole buffer, formatting it in a pleasant way." 
  (interactive) 
  (save-excursion 
    (astyle-region (point-min) (point-max)))) 

(add-hook 'c-mode-common-hook 
          '(lambda () 
             (define-key c-mode-map "\C-cr" 'astyle-region) 
             (define-key c-mode-map "\C-cb" 'astyle-buffer) 
             (define-key c++-mode-map "\C-cr" 'astyle-region) 
             (define-key c++-mode-map "\C-cb" 'astyle-buffer))) 

;;; vinurs-astyle.el ends here
