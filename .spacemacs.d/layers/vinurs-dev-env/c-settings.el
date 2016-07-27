;;; c-settings.el --- 

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)c-settings.el,v 0.0 2016/05/02 09:11:36 vinurs Exp $
;; Changed: <vinurs 07/27/2016 09:08:36>
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
;;   (require 'c-settings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; (evil-end-of-line &optional COUNT)

;; Create my personal style.
(defconst vinurs-c-style
  '(
    ;; c的缩进为４个空格
    (c-basic-offset . 8)
    (indent-tabs-mode . nil)
	;; 按tab键之后缩进
    (c-tab-always-indent  . t)

	;; 宏相关设置
	;; 宏设置相关 *********************************
	;; 在c语言中，对宏进行语法分析，这样便于缩进
	(c-syntactic-indentation-in-macros . t)
	;; 这个是专属于cc-mode的，对宏定义最后一行的反斜杠的位置的定义
	(c-backslash-column . 33)
	;; 对于反斜杠进行连接的代码，自动对齐最后的反斜杠
	(c-auto-align-backslashes . t)
	;; 宏设置相关结束 *****************************
	
	;; 这个不知道有什么用
    ;; (c-comment-only-line-offset . 8)
	
    ;; ;; (c-hanging-braces-alist     . ((substatement-open after)
    ;; ;;                                (brace-list-open)))
    ;; (c-hanging-colons-alist     . ((member-init-intro before)
    ;;                                (inher-intro)
    ;;                                ;; (case-label after)
    ;;                                (label after)
    ;;                                (access-label after)))
    ;; (c-cleanup-list             . (
    ;;                                ;; scope-operator
    ;;                                ;; 如果函数体为空的时候直接将{}连起来
    ;;                                empty-defun-braces
    ;;                                ;; } else {变紧凑
    ;;                                ;; brace-else-brace
    ;;                                ;; brace-elseif-brace
    ;;                                ;; compact-empty-funcall
    ;;                                ;; defun-close-semi
    ;;                                )
    ;;                             )
    ;; (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
    ;;                                (substatement-open . 0)
    ;;                                ;; case语句跟switch同列
    ;;                                (case-label        . 0)
    ;;                                (block-open        . 4)
    ;;                                (knr-argdecl-intro . -)))
    ;; (c-echo-syntactic-information-p . t)

    )
  "vinurs' C Programming Style")
(c-add-style "vinurs" vinurs-c-style)
(defconst vinurs-c-style
  '(
    ;; c的缩进为４个空格
    (c-basic-offset . 8)
    (indent-tabs-mode . nil)
	;; 按tab键之后缩进
    (c-tab-always-indent  . t)

	;; 宏相关设置
	;; 宏设置相关 *********************************
	;; 在c语言中，对宏进行语法分析，这样便于缩进
	(c-syntactic-indentation-in-macros . t)
	;; 这个是专属于cc-mode的，对宏定义最后一行的反斜杠的位置的定义
	(c-backslash-column . 33)
	;; 对于反斜杠进行连接的代码，自动对齐最后的反斜杠
	(c-auto-align-backslashes . t)
	;; 宏设置相关结束 *****************************
	
	;; 这个不知道有什么用
    ;; (c-comment-only-line-offset . 8)
	
    ;; ;; (c-hanging-braces-alist     . ((substatement-open after)
    ;; ;;                                (brace-list-open)))
    ;; (c-hanging-colons-alist     . ((member-init-intro before)
    ;;                                (inher-intro)
    ;;                                ;; (case-label after)
    ;;                                (label after)
    ;;                                (access-label after)))
    ;; (c-cleanup-list             . (
    ;;                                ;; scope-operator
    ;;                                ;; 如果函数体为空的时候直接将{}连起来
    ;;                                empty-defun-braces
    ;;                                ;; } else {变紧凑
    ;;                                ;; brace-else-brace
    ;;                                ;; brace-elseif-brace
    ;;                                ;; compact-empty-funcall
    ;;                                ;; defun-close-semi
    ;;                                )
    ;;                             )
    ;; (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
    ;;                                (substatement-open . 0)
    ;;                                ;; case语句跟switch同列
    ;;                                (case-label        . 0)
    ;;                                (block-open        . 4)
    ;;                                (knr-argdecl-intro . -)))
    ;; (c-echo-syntactic-information-p . t)

    )
  "vinurs' gluster Programming Style")

;; Customizations for all modes in CC Mode.
(defun vinurs-c-mode-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "vinurs")
  ;; other customizations
  ;; we like auto-newline, but not hungry-delete
  ;; (c-toggle-auto-newline 1)
  )
(add-hook 'c-mode-hook 'vinurs-c-mode-hook)




(defun my-c-mode-font-lock-if0 (limit)
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

(defun my-c-mode-common-hook ()
  (font-lock-add-keywords
   nil
   '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end)) 

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook) 


;; 首先是一个小函数，把所有的 #if 0 包含的代码给折叠起来。
(defun my-hide-if-0()
  "hide #if 0 blocks, inspired by internet. --lgfang"
  (interactive)
  (require 'hideif)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^[ \t]*#if[ \t]*0" nil t) (hide-ifdef-block)) )
  ) 
(add-hook 'c-mode-hook 'my-hide-if-0)


;; 代码copy from http://blog.chinaunix.net/uid-7717190-id-2564925.html
(add-hook 'c-mode-common-hook
  (lambda ()
	(spacemacs/set-leader-keys "he" 'my-hif-toggle-block) 
	;; (define-key c-mode-base-map (kbd "M-.") 'my-hif-toggle-block)
	)) 

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


(provide 'c-settings)

;;; c-settings.el ends here
