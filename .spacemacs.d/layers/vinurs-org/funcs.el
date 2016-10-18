;;; funcs.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)funcs.el,v 0.0 2016/08/31 09:50:13 vinurs Exp $
;; Changed: <vinurs 10/18/2016 22:02:00>
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

(add-hook 'org-mode-hook '(lambda ()
                            ;; keybinding for editing source code blocks
							(spacemacs/set-leader-keys-for-major-mode 'org-mode
							  "i e" 'org-edit-src-code) 
							;; keybinding for inserting code blocks
							(spacemacs/set-leader-keys-for-major-mode 'org-mode
							  "i s" 'org-insert-src-block) 

							)) 

;; (defvar emacs-english-font "Monaco"
;;   "The font name of English.") 

;; (defvar emacs-cjk-font "Hiragino Sans GB W3"
;;   "The font name for CJK.") 

;; (defvar emacs-font-size-pair '(15 . 18)
;;   "Default font size pair for (english . chinese)") 
;; (defvar emacs-font-size-pair-list
;;   '(( 5 .  6) (10 . 12)
;; 	 (13 . 16) (15 . 18) (17 . 20)
;; 	 (19 . 22) (20 . 24) (21 . 26)
;; 	 (24 . 28) (26 . 32) (28 . 34)
;; 	 (30 . 36) (34 . 40) (36 . 44))
;;   "This list is used to store matching (englis . chinese) font-size.") 

;; (defun font-exist-p (fontname)
;;   "Test if this font is exist or not."
;;   (if (or (not fontname) (string= fontname ""))
;; 	nil
;;     (if (not (x-list-fonts fontname)) nil t))) 
;; (defun set-font (english chinese size-pair)
;;   "Setup emacs English and Chinese font on x window-system."

;;   (if (font-exist-p english)
;; 	(set-frame-font (format "%s:pixelsize=%d" english (car size-pair)) t))

;;   (if (font-exist-p chinese)
;; 	(dolist (charset '(kana han symbol cjk-misc bopomofo))
;; 	  (set-fontset-font (frame-parameter nil 'font) charset
;; 		(font-spec :family chinese :size (cdr size-pair)))))) 

;; ;; Setup font size based on emacs-font-size-pair
;; (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair) 


;; (setq fonts
;;   (cond ((eq system-type 'darwin)     '("Monaco"    "STHeiti"))
;; 	((eq system-type 'gnu/linux)  '("Menlo"     "WenQuanYi Zen Hei"))
;; 	((eq system-type 'windows-nt) '("Consolas"  "Microsoft Yahei")))) 
;; (set-face-attribute 'default nil :font
;;   (format "%s:pixelsize=%d" (car fonts) 12)) 
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font) charset
;; 	(font-spec :family (car (cdr fonts))))) 
;; ;; Fix chinese font width and rescale
;; (setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Micro Hei Mono" . 1.2) ("STHeiti". 1.2))) 


(provide 'funcs)

;;; funcs.el ends here
