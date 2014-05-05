;;; vinurs-electric-pair.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-electric-pair.el,v 0.0 2013/08/15 19:10:46 vinurs Exp $
;; Changed: <vinurs 08/15/2013 20:19:27>
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
;;   (require 'vinurs-electric-pair)




;;; Code:

(provide 'vinurs-electric-pair)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(electric-pair-mode 1)
;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            ) )

(defun insert-bracket-pair (leftBracket rightBracket)
  "Insert a matching bracket.
If region is not active, place the cursor between them.
If region is active, insert around the region, place the cursor after the right bracket.

The argument leftBracket rightBracket are strings."
  (if (region-active-p)
      (let (
            (p1 (region-beginning))
            (p2 (region-end))
            )
        (goto-char p2)
        (insert rightBracket)
        (goto-char p1)
        (insert leftBracket)
        (goto-char (+ p2 2))
        )
    (progn
      (insert leftBracket rightBracket)
      (backward-char 1) ) )
  )

(defun insert-pair-paren () (interactive) (insert-bracket-pair "(" ")") )
(defun insert-pair-bracket () (interactive) (insert-bracket-pair "[" "]") )
(defun insert-pair-brace () (interactive) (insert-bracket-pair "{" "}") )

(defun insert-pair-double-straight-quote () (interactive) (insert-bracket-pair "\"" "\"") )
(defun insert-pair-single-straight-quote () (interactive) (insert-bracket-pair "'" "'") )

(defun insert-pair-single-angle-quote‹› () (interactive) (insert-bracket-pair "‹" "›") )
(defun insert-pair-double-angle-quote«» () (interactive) (insert-bracket-pair "«" "»") )
(defun insert-pair-double-curly-quote“” () (interactive) (insert-bracket-pair "“" "”") )
(defun insert-pair-single-curly-quote‘’ () (interactive) (insert-bracket-pair "‘" "’") )

(defun insert-pair-corner-bracket「」 () (interactive) (insert-bracket-pair "「" "」") )
(defun insert-pair-white-corner-bracket『』 () (interactive) (insert-bracket-pair "『" "』") )
(defun insert-pair-angle-bracket〈〉 () (interactive) (insert-bracket-pair "〈" "〉") )
(defun insert-pair-double-angle-bracket《》 () (interactive) (insert-bracket-pair "《" "》") )
(defun insert-pair-white-lenticular-bracket〖〗 () (interactive) (insert-bracket-pair "〖" "〗") )
(defun insert-pair-black-lenticular-bracket【】 () (interactive) (insert-bracket-pair "【" "】") )
(defun insert-pair-tortoise-shell-bracket〔〕 () (interactive) (insert-bracket-pair "〔" "〕") )


(eal-define-keys
 `(c-mode-base-map awk-mode-map)
 `(("{" skeleton-c-mode-left-brace)))
(defun skeleton-c-mode-left-brace (arg)
  (interactive "P")
  (if  (c-in-literal (c-most-enclosing-brace (c-parse-state)))
      (self-insert-command 1)
    ;; auto insert complex things.
    (let* ((current-line (delete-and-extract-region (line-beginning-position) (line-end-position)))
           (lines (and arg (mark t) (delete-and-extract-region (mark t) (point))))
           (after-point (make-marker)))
       ;;; delete extra blank begin and after the LINES
      (setq lines (and lines
                       (with-temp-buffer
                         (insert lines)
                         (beginning-of-buffer)
                         (delete-blank-lines)
                         (delete-blank-lines)
                         (end-of-buffer)
                         (delete-blank-lines)
                         (delete-blank-lines)
                         (buffer-string))))
      (save-excursion
        (let* ((old-point (point)))
          (insert (if current-line current-line "")  "{\n")
          (and lines (insert lines))
          (move-marker after-point (point))
          (insert "\n}")
          (indent-region old-point (point) nil)))
      (goto-char after-point)
      (c-indent-line))))

;; TODO 支持饥饿删除

;;; vinurs-electric-pair.el ends here
