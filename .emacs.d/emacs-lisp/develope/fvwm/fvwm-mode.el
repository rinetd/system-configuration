;;; FVWM-MODE.EL --- mode for editing fvwm's config files

;; Copyright (C) 1996 Linh Dang
;; Modifications made 2001 Glen Lee Edwards

;; Author: Linh Dang <linhd@nortel.ca>
;; Maintainer: Glen Lee Edwards <glen@fcwm.org>
;; Created: 04 Mar 1996
;; Version: 1.0
;; Keywords:

 
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; A copy of the GNU General Public License can be obtained from this
;; program's author (send electronic mail to <linhd@nortel.ca>) or
;; from the Free Software Foundation, Inc., 675 Mass Ave, Cambridge,
;; MA 02139, USA.

;; LCD Archive Entry:
;; fvwm-mode|Linh Dang|<linhd@nortel.ca>
;; |mode for editing fvwm's config files
;; |$Date: 1996/04/01 16:39:20 $|$Revision: 1.7 $|~/modes/fvwm-mode.el

;;; Commentary:
;;;
;;; I found this work by Linh Dang in an old email archive.  I've since modified it
;;; for my personal use with xemacs.  Feel free to use it and modify it as needed
;;; for your own personal use.  - Glen Lee Edwards <glen@fcwm.org>
;;;
;;;##############################################################
;;;
;;; Usage:
;;;
;;; in your emacs configuration file::
;;;
;(load "fvwm-mode")  
;;;;   Autoload this mode
;  (autoload 'fvwm-mode "fvwm-mode" "Mode for editing fvwm files" t)
;  (setq auto-mode-alist 
;	   (cons '("\\.fvwm2rc$\\|\\.fvwmrc$" . fvwm-mode) auto-mode-alist))
;;;
;;;###############################################################
;;;
;;; Change log:
; $Log: fvwm-mode.el,v $
;
; Revision 1.7a 12/01/2001 GLE
; Removed keybinding for fvwm-indent-line function. It wouldn't allow me to use the
; tab key to indent.  By removing it, tab now works as a normal tab.
;
; Revision 1.7 02/24/2001 GLE
; Add in fvwm-mode faces
;
; Revision 1.6  1996/04/01 16:39:20  linhd
; fix fvwm-mark-function
;
; Revision 1.5  1996/04/01 16:27:03  linhd
; simpilified fvwm-indent-line
;
; Revision 1.4  1996/03/07 19:00:04  linhd
; spell-checked
;
; Revision 1.3  1996/03/07  16:14:40  linhd
; complete now
;
; Revision 1.2  1996/03/05  14:45:14  linhd
; working version
;
; Revision 1.1  1996/03/04  15:14:48  linhd
; Initial revision
;

;;; Code:

(defconst fvwm-mode-version (substring "$Revision: 1.7a $" 11 -2)
  "$Id: fvwm-mode.el,v 1.7 12/01/2001 GLE Exp $

Report bugs to: Glen Lee Edwards <glen@fcwm.org>")

(provide 'fvwm-mode)

(defvar fvwm-function-start-word "\\(Popup\\|Function\\)")
(defvar fvwm-function-start (concat "^" fvwm-function-start-word))
(defvar fvwm-function-end-word (concat "End" fvwm-function-start-word))
(defvar fvwm-function-end (concat "^" fvwm-function-end-word  "\\([ \t]*\n\\)?"))
(defvar fvwm-line-anchor (concat "\\(#\\|*\\)"
				   "\\|"
				   "\\(" fvwm-function-end-word "\\)"))

(defconst fvwm-command "[A-Z][a-z]+")

(defvar fvwm-mode-basic-indent 4
  "number of spaces for tab")

(defvar fvwm-mode-hook nil
  "Hook to be run when mode is entered")

(defvar fvwm-syntax-table
  (let ((table (copy-syntax-table)))
    (modify-syntax-entry ?\#	"<"	table)
    (modify-syntax-entry ?\n	">#"	table)
    (modify-syntax-entry ?\"	"\"\""	table)
    (modify-syntax-entry ?\-	"_"	table)
    (modify-syntax-entry ?/	"_"	table)
    table)
  "Syntax table in use in Fvwm mode")

(defvar fvwm-abbrev-table nil
  "Abbrev table used in Fvwm mode")
(define-abbrev-table 'fvwm-abbrev-table nil)

;; XEmacs-patch by Alastair Burt <burt@dfki.uni-kl.de>
;; using font-lock-keyword-face instead of font-lock-reference-face

;(unless (find-face 'font-lock-reference-face)
;  (make-face 'font-lock-reference-face)
;  (unless (face-differs-from-default-p 'font-lock-reference-face)
;    (copy-face 'italic 'font-lock-reference-face)))

(defvar fvwm-font-lock-keywords
  '(
;; original code changed by Erik Sundermann 03/06/96
;    ("^\\(Popup\\|Function\\)[ \t]+\\\"\\([^\"]+\\)\\\"[ \t]*$"
;     (1 font-lock-type-face nil t)
;     (2 font-lock-function-name-face t t))
    ("^\\(Popup\\|Function\\)[ \t]+\\\"\\([^\"]+\\)\\\"[ \t]*$"
     1 font-lock-type-face nil t)
    ("^\\(Popup\\|Function\\)[ \t]+\\\"\\([^\"]+\\)\\\"[ \t]*$"
     2 font-lock-function-name-face t t)
    ("\\(^End\\(Popup\\|Function\\)\\)[ \t]*$" 1 font-lock-type-face)
;    ("^\\*\\(\\sw+\\)" 1 font-lock-keyword-face)
    ("^[A-Z][A-Za-z]+" . font-lock-keyword-face)
    )
  "default font-lock keywords")

(defvar fvwm-imenu-generic-expression
  '(("Sections"
     "^#+ \\(\\(\\sw\\|\\s_\\|\\s-\\)+\\) #+" 1)
    ("Popups"
     "^Popup[ \t]+\\\"\\([^\"]+\\)\\\"" 1)
    ("Functions"
     "^Function[ \t]+\\\"\\([^\"]+\\)\\\"" 1)
    ))

;; XEmacs-patch by Alastair Burt <burt@dfki.uni-kl.de>
; (defvar fvwm-mode-map
;   (let ((map (make-sparse-keymap "Fvwm")))
;     (define-key map "\t"		'fvwm-indent-line)
;     (define-key map "\e\C-h"		'fvwm-mark-function)
;     (define-key map [C-kp-enter]	'fvwm-mark-function)
;     (define-key map "\C-c\C-f"		'fvwm-insert-function)
;     (define-key map "\C-c\C-p"		'fvwm-insert-popup)
;     map))

(defvar fvwm-mode-map
  (let ((map (make-sparse-keymap)))
    ;(set-keymap-name map  "Fvwm")
;    (define-key map "\t"		'fvwm-indent-line)
    (define-key map "\e\C-h"		'fvwm-mark-function)
    (define-key map "\C-c\C-f"		'fvwm-insert-function)
    (define-key map "\C-c\C-p"		'fvwm-insert-popup)
    map))

(defun fvwm-find-indent-col ()
  "Find the indent column in Fvwm mode"
  (save-excursion
    (line-move -1)
    (beginning-of-line)
    (cond ((eq 0 (point)) 0)
	  ((looking-at "#") (fvwm-find-indent-col))
	  ((looking-at fvwm-function-start)
	   fvwm-mode-basic-indent)
	  (t (back-to-indentation) (current-column)))))

;(defun fvwm-indent-line ()
;  "Indent a line in Fvwm mode"
;  (interactive)
;  (let ((offset (- (point) (save-excursion
;			     (back-to-indentation)
;			     (point))))
;	previous)
;    (save-excursion
;      (beginning-of-line)
;      (delete-region (point)
;		     (progn (skip-chars-forward " \t")
;			    (point)))
;      (setq previous (if (looking-at fvwm-line-anchor)
;			 0
;		       (fvwm-find-indent-col)))
;      (indent-to previous))
;    (back-to-indentation)
;    (goto-char (+ (point) offset))))

(defun fvwm-indent-line ()
  "Indent a line in Fvwm mode"
  (interactive)
  (let ((orig-pos (point-marker))
	(previous (if (looking-at fvwm-line-anchor) 0
		    (fvwm-find-indent-col))))
    (save-excursion
      (beginning-of-line)
      (delete-region (point)
		     (progn (skip-chars-forward " \t")
			    (point)))
      (indent-to previous))
    (back-to-indentation)
    (goto-char orig-pos)))

(defun fvwm-indent-comment ()
  "Indent a comment in Fvwm mode"
  (interactive)
  (save-excursion
    (beginning-of-line)
    (delete-region (point)
		   (progn (skip-chars-forward " \t")
			  (point)))))

(defun fvwm-mark-function ()
  "Mark a Function or a Popup, leave mark at the end and point at
the beginning of the block"
  (interactive)
  (let ((beg 0) (end 0) (orig (point)))
    (save-excursion
      (and (re-search-backward fvwm-function-start (point-min) t)
	   (setq beg (point)))
      (and (re-search-forward fvwm-function-end (point-max) t)
	   (> (point) orig)
	   (setq end (point))))
    (or
     (and (> beg 0)
	  (> end beg)
	  (prog1 t
	    (push-mark end nil t)
	    (goto-char beg)))
     (error "not in a valid function"))))

(defun fvwm-insert-block (type)
  (beginning-of-line)
  (push-mark)
  (insert type " \"")
  (let ((name-point (point)))
    (insert "\"\nNop\t\"\"\nEnd" type)
    (indent-region (region-beginning) (region-end) nil)
    name-point))

(defun fvwm-insert-function ()
  "Insert a Function skeleton"
  (interactive)
  (let ((name-point (fvwm-insert-block "Function")))
    (goto-char name-point)))


(defun fvwm-insert-popup ()
  "Insert a Popup skeleton"
  (interactive)
  (let ((name-point (fvwm-insert-block "Popup")))
    (goto-char name-point)))

	  

(defun fvwm-mode ()
  "Major mode for editing fvwm config files (.fvwmrc).
The mode correctly (I hope) indents `Function's and `Popup's. Support
for Font-lock and Imenu is also available.

\\[fvwm-indent-line] correctly indent the current line.
\\[fvwm-mark-function] mark a `Function' or a `Popup'
\\[fvwm-insert-function] insert a `Function' skeleton
\\[fvwm-insert-popup] insert a `Popup' skeleton"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table fvwm-syntax-table)
  (use-local-map fvwm-mode-map)
  (setq local-abbrev-table fvwm-abbrev-table)
 
;  (make-local-variable	'indent-line-function)
  (make-local-variable	'comment-indent-function)
  (make-local-variable	'comment-start)
  (make-local-variable	'comment-start-skip)
  (make-local-variable	'font-lock-defaults)
  (make-local-variable	'require-final-newline)
  (make-local-variable	'imenu-generic-expression)
  (setq major-mode 'fvwm-mode
	mode-name "Fvwm"
;	indent-line-function 'fvwm-indent-line
	comment-indent-function 'fvwm-indent-comment
	comment-start "# "
	comment-end ""
	comment-start-skip "#[ \t]*"
	font-lock-defaults '(fvwm-font-lock-keywords nil)
	require-final-newline t
	imenu-generic-expression fvwm-imenu-generic-expression
	)
  (run-hooks 'fvwm-mode-hook))

;;; Additions by Glen Lee Edwards 02/24/01

;#############  FVWM-CONF-FACE  ##################
(defvar fvwm-conf-face 'fvwm-conf-face
  "Special face in fvwm mode")
(defface fvwm-conf-face
  '((((class color) (background dark)) (:foreground "brown" :bold t :size "11pt" :family "lucida"))
    (((class color) (background light)) (:foreground "brown" :bold t :size "11pt" :family "lucida"))
    (((class grayscale) (background light))
     (:foreground "DimGray" :bold t :italic t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t :italic t))
    (t (:bold t)))
  "Special face in fvwm mode."
  :group 'fvwm-faces)
(defun fvwm-mode-setup1 ()
  (setq font-lock-keywords
        (cons '("^Key\\|^Style\\|^Mouse\\|^IconFont\\|ImagePath\\|^ModuleSynchronous\\|^Emulate\\|^EdgeResistance\\|^EdgeScroll\\|^ClickTime\\|^WindowShadeSteps\\|^SnapAttraction\\|^SnapGrid\\|^ColormapFocus\\|^AddToDecor\\|^DestroyDecor\\|ButtonStyle\\|^MenuStyle\\|AddButtonStyle\\|TitleStyle\\|^ModulePath\\|BorderStyle\\|^SetAnimation\\|^DeskTopSize" . fvwm-conf-face) font-lock-keywords)))
(add-hook 'fvwm-mode-hook 'fvwm-mode-setup1)

;#############  FVWM-MODULE-FACE  ##################
(defvar fvwm-module-face 'fvwm-module-face
  "Special face for modules in fvwm mode")
(defface fvwm-module-face
  '((((class color) (background dark)) (:foreground "black" :bold t :size "11pt" :family "lucida"))
    (((class color) (background light)) (:foreground "black" :bold t :size "11pt" :family "lucida"))
    (((class grayscale) (background light))
     (:foreground "DimGray" :bold t :italic t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t :italic t))
    (t (:bold t)))
  "Special face for modules in fvwm mode."
  :group 'fvwm-faces)
(defun fvwm-mode-setup2 ()
  (setq font-lock-keywords
        (cons '("\\*\\w+" . fvwm-module-face) font-lock-keywords)))
(add-hook 'fvwm-mode-hook 'fvwm-mode-setup2)

;#############  FVWM-BUTTON-CONF-FACE  ##################
(defvar fvwm-button-conf-face 'fvwm-button-conf-face
  "Special face for button-confs in fvwm mode")
(defface fvwm-button-conf-face
  '((((class color) (background dark)) (:foreground "orange3" :bold t :size "11pt" :family "lucida"))
    (((class color) (background light)) (:foreground "orange3" :bold t :size "11pt" :family "lucida"))
    (((class grayscale) (background light))
     (:foreground "DimGray" :bold t :italic t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t :italic t))
    (t (:bold t)))
  "Special face for button-confs in fvwm mode."
  :group 'fvwm-faces)
(defun fvwm-mode-setup3 ()
  (setq font-lock-keywords
        (cons '("\\bAction\\b\\|\\bExec\\b\\|\\bTitle\\b\\|\\bIcon\\b" . fvwm-button-conf-face) font-lock-keywords)))
(add-hook 'fvwm-mode-hook 'fvwm-mode-setup3)

;#############  FVWM-FUNC-MENU-FACE  ##################
(defvar fvwm-func-menu-face 'fvwm-func-menu-face
  "Special face for func-menus in fvwm mode")
(defface fvwm-func-menu-face
  '((((class color) (background dark)) (:foreground "palevioletred" :bold t :size "11pt" :family "lucida"))
    (((class color) (background light)) (:foreground "palevioletred" :bold t :size "11pt" :family "lucida"))
    (((class grayscale) (background light))
     (:foreground "DimGray" :bold t :italic t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t :italic t))
    (t (:bold t)))
  "Special face for func-menus in fvwm mode."
  :group 'fvwm-faces)
(defun fvwm-mode-setup4 ()
  (setq font-lock-keywords
        (cons '("AddToMenu\\|AddToFunc" . fvwm-func-menu-face) font-lock-keywords)))
(add-hook 'fvwm-mode-hook 'fvwm-mode-setup4)

;#############  FVWM-PIPEREAD-FACE  ##################
(defvar fvwm-piperead-face 'fvwm-piperead-face
  "Special face for pipereads in fvwm mode")
(defface fvwm-piperead-face
  '((((class color) (background dark)) (:foreground "\#900090" :bold t :size "11pt" :family "lucida"))
    (((class color) (background light)) (:foreground "\#900090" :bold t :size "11pt" :family "lucida"))
    (((class grayscale) (background light))
     (:foreground "DimGray" :bold t :italic t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t :italic t))
    (t (:bold t)))
  "Special face for pipereads in fvwm mode."
  :group 'fvwm-faces)
(defun fvwm-mode-setup5 ()
  (setq font-lock-keywords
        (cons '("PipeRead" . fvwm-piperead-face) font-lock-keywords)))
(add-hook 'fvwm-mode-hook 'fvwm-mode-setup5)

;#############  FVWM-SPECIAL-FACE  ##################
(defvar fvwm-special-face 'fvwm-special-face
  "Special face for fvwm mode")
(defface fvwm-special-face
  '((((class color) (background dark)) (:foreground "\#ff5555" :bold t :size "11pt" :family "lucida"))
    (((class color) (background light)) (:foreground "\#ff5555" :bold t :size "11pt" :family "lucida"))
    (((class grayscale) (background light))
     (:foreground "DimGray" :bold t :italic t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t :italic t))
    (t (:bold t)))
  "Special face for fvwm mode."
  :group 'fvwm-faces)
(defun fvwm-mode-setup6 ()
  (setq font-lock-keywords
        (cons '("\\-[A-Za-z0-9\\-\\_]+" . fvwm-special-face) font-lock-keywords)))
(add-hook 'fvwm-mode-hook 'fvwm-mode-setup6)

;#############  FVWM-MYCOMMENTS-FACE  ##################
(defvar fvwm-mycomments-face 'fvwm-mycomments-face
  "Special face for my personal comments in fvwm mode.")
(defface fvwm-mycomments-face
  '((((class color) (background dark)) (:foreground "purple" :bold t :size "11pt" :family "lucida"))
    (((class color) (background light)) (:foreground "purple" :bold t :size "11pt" :family "lucida"))
    (((class grayscale) (background light))
     (:foreground "DimGray" :bold t :italic t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t :italic t))
    (t (:bold t)))
  "Special face for my personal comments in fvwm mode."
  :group 'fvwm-faces)
(defun glen-fvwm-mode-setup7 ()
  (setq font-lock-keywords
        (cons '("^#\\..*" 0 fvwm-mycomments-face t t) font-lock-keywords)))
(add-hook 'fvwm-mode-hook 'glen-fvwm-mode-setup7)

;;; FVWM-MODE.EL ends here

