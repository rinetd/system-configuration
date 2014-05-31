;;; init-doxymacs.el --- 

;; Copyright 2014 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-doxymacs.el,v 0.0 2014/05/31 22:56:25 vinurs Exp $
;; Changed: <vinurs 06/01/2014 00:15:24>
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
;;   (require 'init-doxymacs)




;;; Code:

(provide 'init-doxymacs)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require 'doxymacs)

(add-hook 'c-mode-common-hook 'doxymacs-mode)

(defun my-doxymacs-font-lock-hook ()
   (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
  (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

(setq doxymacs-doxygen-style "JavaDoc")

;; my custom c++ multiline and single comment
(defconst doxymacs-JavaDoc-blank-multiline-comment-template
 '("/**" > n " * @brief " p > n " *" > n  > "*/")
 "Default JavaDoc-style template for a blank multiline doxygen comment.")


;; custom macro in .h file


;; custom my function comment
(defconst doxymacs-JavaDoc-function-comment-template
 '((let ((next-func (doxymacs-find-next-func)))
     (if next-func
	 (list
	  'l
	  "/** " '> 'n
	  " * " (doxymacs-doxygen-command-char) "brief " 'p '> 'n
      " * " '> 'n
	  (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
	  (unless (string-match
                   (regexp-quote (cdr (assoc 'return next-func)))
                   doxymacs-void-types)
	    '(l " * " > n " * " (doxymacs-doxygen-command-char)
		"return "  > n))
	  " */" '>)
       (progn
	 (error "Can't find next function declaration.")
	 nil))))
 "Default C++-style template for function documentation.")

;; (defconst doxymacs-C++-file-comment-template
(defconst doxymacs-JavaDoc-file-comment-template
 '("/* ******************************************************************************" > n
   " * Copyright (c) "
   (format-time-string "%Y")
   " EmbedWay Information Technologies Co. Ltd." > n
      ;; " * Copyright (c) " "(format-time-string "%Y")" " EmbedWay Information Technologies Co. Ltd." > n
   " * ALL rights reserved." > n
   " * ******************************************************************************/" > n
   "/*! " > n
   " * @file       @(#)"
   (if (buffer-file-name)
       (file-name-nondirectory (buffer-file-name))
     "") > n
   " * @brief      " p > n
   " *" > n
   " * @version    1.0" > n
   " * @author     " (user-full-name) > n
   " * @date       " (current-time-string) > n
   "*" > n
   " * *****************************************************************************/" > n
   "/* " > n
   " * Changed:    < >" > n
   " * Email:     " (doxymacs-user-mail-address) > n
   " * Compiler:   gcc" > n
   " * Revision:   none" > n
   "*" > n
   "*" > n
   " * ******************************************************************************" > n
   "*/" > n
   > n
   )
 "Default JaveDoc-style template for file documentation.")



(define-key doxymacs-mode-map "\C-cdd"
  'doxymacs-define-dot-h-file-macro)

(defun doxymacs-define-dot-h-file-macro ()
  "Inserts Doxygen documentation for the next function declaration at
current point."
  (interactive "*")
  (doxymacs-call-template "dot-h-file-macro")
  )

;;#ifndef _A_H_20110824075139
;;#define _A_H_20110824075139


;;#endif /* _A_H_20110824075139 */


;;#ifndef _(>>>FILE_UPCASE<<<)_H_(>>>YEAR<<<)(>>>MONTH<<<)(>>>DAY<<<)(>>>HOUR<<<)(>>>MINUTE<<<)(>>>SECOND<<<)
;;#define _(>>>FILE_UPCASE<<<)_H_(>>>YEAR<<<)(>>>MONTH<<<)(>>>DAY<<<)(>>>HOUR<<<)(>>>MINUTE<<<)(>>>SECOND<<<)


;;#endif /* _(>>>FILE_UPCASE<<<)_H_(>>>YEAR<<<)(>>>MONTH<<<)(>>>DAY<<<)(>>>HOUR<<<)(>>>MINUTE<<<)(>>>SECOND<<<) */

(defconst doxymacs-JavaDoc-dot-h-file-macro-template
  '("#ifndef _"
    (upcase
     (file-name-sans-extension
      (if (buffer-file-name)
          (file-name-nondirectory (buffer-file-name))
        )))
    "_H_"
    (insert(format-time-string "%Y%m%d%H%M%S"))
    > n
    "#define _"
    (upcase
     (file-name-sans-extension
      (if (buffer-file-name)
          (file-name-nondirectory (buffer-file-name))
        )))
    "_H_"
    (insert(format-time-string "%Y%m%d%H%M%S"))
    > n
    > n
    > n
    "#endif /* _"
    (upcase
     (file-name-sans-extension
      (if (buffer-file-name)
          (file-name-nondirectory (buffer-file-name))
        )))
    "_H_"
    (insert(format-time-string "%Y%m%d%H%M%S"))
    " */"> n
    )
  "Default dot h file macro template for file documentation.")





;;; init-doxymacs.el ends here
