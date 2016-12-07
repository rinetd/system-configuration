;;; vinurs-org-funcs.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)funcs.el,v 0.0 2016/08/31 09:50:13 vinurs Exp $
;; Changed: <vinurs 12/07/2016 10:34:42>
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
;;   (require 'funcs)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(defun org-insert-html-readmore ()
  "Insert
#+BEGIN_HTML
  <!--more-->
#+END_HTML
after the current line"
  (interactive)
  (save-restriction
    (widen)
    (save-excursion
	  (end-of-line) 
	  (newline-and-indent)
	  (message "%d" (- (line-number-at-pos) 1)) 
	  (insert
		"#+BEGIN_HTML
  <!--more-->
#+END_HTML"))
    )) 


(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
	(let ((src-code-types
			'("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
			   "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
			   "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
			   "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
			   "scheme" "sqlite")))
	  (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code))) 



(provide 'vinurs-org-funcs)

;;; funcs.el ends here
