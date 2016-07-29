;;; vinurs-doxymacs.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-doxymacs.el,v 0.0 2016/07/28 23:19:44 vinurs Exp $
;; Changed: <vinurs 07/29/2016 08:34:53>
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
;;   (require 'vinurs-doxymacs)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################




(spacemacs/declare-prefix "oad" "graphviz/doxymacs") 
(setq vinurs/doxymacs-key-binding-prefixes "oad")

(add-hook 'c-mode-common-hook 'doxymacs-mode)

(with-eval-after-load 'doxymacs
  (spacemacs/set-leader-keys
	(concat vinurs/doxymacs-key-binding-prefixes "f") 'doxymacs-insert-function-comment
	;; 这个暂时不需要
	;; (concat vinurs/doxymacs-key-binding-prefixes "s") 'doxymacs-blank-singleline-comment
	(concat vinurs/doxymacs-key-binding-prefixes "m") 'doxymacs-blank-multiline-comment
	(concat vinurs/doxymacs-key-binding-prefixes "d") 'doxymacs-define-dot-h-file-macro
	) 

  ;; (define-key doxymacs-mode-map "\C-cdd"
  ;;   'doxymacs-define-dot-h-file-macro)

  )

(defun my-doxymacs-font-lock-hook ()
   (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
  (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook) 

(setq doxymacs-doxygen-style "JavaDoc") 

;; my custom c++ multiline and single comment
(defconst doxymacs-JavaDoc-blank-multiline-comment-template
 '("/**" > n " * " p > n " *" > n  > "*/")
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



(defun doxymacs-define-dot-h-file-macro ()
  "Inserts Doxygen documentation for the next function declaration at
current point."
  (interactive "*")
  (doxymacs-call-template "dot-h-file-macro")
  )

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
    "#ifdef __cplusplus" > n
    "#define EXTERN_C_BEGIN  extern \"C\" {" > n
    "#define EXTERN_C_END    } /* __cplusplus */" > n
    "#else" > n
    "#define EXTERN_C_BEGIN" > n
    "#define EXTERN_C_END" > n
    "#endif" > n
    > n
    "EXTERN_C_BEGIN;" > n
    > n
    "/* ********************************* ABBREVIATIONS ******************************" > n
    " * g_  		global variable " > n
    " * s_  		static variable " > n
    " * c_  		const variable " > n
    " *" > n
    " *" > n
    "* *****************************************************************************/" > n
    > n
    > n
    "/* ************************** system headerfiles **************************** */" > n
    > n
    > n
    > n
    "/* *********************** user-defined headerfiles ************************* */" > n
    > n
    > n
    "/* ******************************* Macros *********************************** */" > n
    "/* function argument qualifier */" > n
    "/* the argument is only for input */" > n
    "#define IN" > n
    "/* the argument is only for output */" > n
    "#define OUT" > n
    "/* the argument's value will be modified */" > n
    "#define MOD" > n
    > n
    > n
    > n
    > n
    "/* ******************** structs, enums, unions, typedefs ******************** */" > n
    > n
    > n
    "/* *********************** extern global variables ************************** */" > n
    > n
    > n
    "/* ************************ extern functions prototypes ********************* */" > n
    > n
    > n
    > n
    > n
    > n
    "EXTERN_C_END;" > n
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



(provide 'vinurs-doxymacs)

;;; vinurs-doxymacs.el ends here
