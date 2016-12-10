;;; c-c++-common-settings.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)c-c++-common-settings.el,v 0.0 2016/12/08 11:13:16 vinurs Exp $
;; Changed: <vinurs 12/10/2016 11:14:16>
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
;;   (require 'c-c++-common-settings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;;  c/c++ common settings

;; 定义各种前缀
(mapc (lambda (x) (apply #'spacemacs/declare-prefix-for-mode x))
  '(
	 ;; Macro相关
	 (c-mode "mm"   "Macro")
	 (c++-mode "mm"   "Macro")
	 ;; hide/show
	 (c-mode "mh"   "hide/show")
	 (c++-mode "mh"   "hide/show")
	 ;; format code
	 (c-mode "mf"   "format")
	 (c++-mode "mf"   "format")
	 )) 


;; 给一段宏后面增加反斜杠
(spacemacs/set-leader-keys-for-major-mode 'c-mode
  "m s" 'c-backslash-region) 
;; 给一段宏后面移反斜杠
(spacemacs/set-leader-keys-for-major-mode 'c-mode
  "m r" (defun remove-c-backslash () (interactive)
		  (setq current-prefix-arg '(4)) ; C-u
		  (call-interactively 'c-backslash-region))
  ) 

;; 给一段宏后面增加反斜杠
(spacemacs/set-leader-keys-for-major-mode 'c++-mode
  "m s" 'c-backslash-region) 
;; 给一段宏后面移反斜杠
(spacemacs/set-leader-keys-for-major-mode 'c++-mode
  "m r" (defun remove-c-backslash () (interactive)
		  (setq current-prefix-arg '(4)) ; C-u
		  (call-interactively 'c-backslash-region))
  ) 

;; #if 0配色
(defun c-common-mode-font-lock-if0 (limit)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (let ((depth 0) str start start-depth)
        (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
          (setq str (match-string 1))
          (if (string= str "if")
			(progn
			  (setq depth (1+ depth))
			  (when (and (null start) (looking-at "\\s-+0"))
				(setq start (match-end 0)
				  start-depth depth)))
            (when (and start (= depth start-depth))
              (c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
              (setq start nil))
            (when (string= str "endif")
              (setq depth (1- depth)))))
        (when (and start (> depth 0))
          (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
  nil) 

(defun c-if0-font-lock ()
  (font-lock-add-keywords
	nil
	'((c-common-mode-font-lock-if0
		(0 font-lock-comment-face prepend)))
	'add-to-end))

(add-hook 'c-mode-hook 'c-if0-font-lock) 
(add-hook 'c++-mode-hook 'c-if0-font-lock) 

;; 首先是一个小函数，把所有的 #if 0 包含的代码给折叠起来。
(defun hide-if-0()
  "hide #if 0 blocks, inspired by internet. --lgfang"
  (interactive)
  (require 'hideif)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^[ \t]*#if[ \t]*0" nil t) (hide-ifdef-block)) )
  ) 
(add-hook 'c-mode-hook 'hide-if-0)
(add-hook 'c++-mode-hook 'hide-if-0) 

;; 对于#ifdef进行折叠

;;; for hideif
(defun my-hif-toggle-block ()
  "toggle hide/show-ifdef-block --lgfang"
  (interactive)
  (require 'hideif)
  (let* ((top-bottom (hif-find-ifdef-block))
		  (top (car top-bottom)))
    (goto-char top)
    (hif-end-of-line)
    (setq top (point))
    (if (hif-overlay-at top)
	  (show-ifdef-block)
      (hide-ifdef-block)))) 

(defun hif-overlay-at (position)
  "An imitation of the one in hide-show --lgfang"
  (let ((overlays (overlays-at position))
		 ov found)
    (while (and (not found) (setq ov (car overlays)))
      (setq found (eq (overlay-get ov 'invisible) 'hide-ifdef)
		overlays (cdr overlays)))
    found)) 

(spacemacs/set-leader-keys-for-major-mode 'c-mode
  "h e" 'my-hif-toggle-block) 
(spacemacs/set-leader-keys-for-major-mode 'c++-mode
  "h e" 'my-hif-toggle-block) 


;; uncrustify-mode
(require 'uncrustify-mode) 
(spacemacs/set-leader-keys-for-major-mode 'c-mode
  "f r" 'uncrustify-region) 
(spacemacs/set-leader-keys-for-major-mode 'c-mode
  "f b" 'uncrustify-buffer) 

(spacemacs/set-leader-keys-for-major-mode 'c++-mode
  "f r" 'uncrustify-region) 
(spacemacs/set-leader-keys-for-major-mode 'c++-mode
  "f b" 'uncrustify-buffer) 



(provide 'c-c++-common-settings)

;;; c-c++-common-settings.el ends here
