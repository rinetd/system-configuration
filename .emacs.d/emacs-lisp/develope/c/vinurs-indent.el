;;; vinurs-indent.el --- 

;; Copyright 2015 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-astyle.el,v 0.0 2015/01/14 08:33:05 vinurs Exp $
;; Changed: <vinurs 01/25/2015 10:28:29>
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

(provide 'vinurs-indent)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; c的缩进为４个空格
(setq c-basic-offset 4)

(setq-default indent-tabs-mode nil)


;; 创建自己的C style: vinurs-c-style


;; astyle
;; (load "astyle-hooks.el")

;; 宏设置相关
;; 在c语言中，对宏进行语法分析，这样便于缩进
(setq c-syntactic-indentation-in-macros t)
;; 这个是专属于cc-mode的，对宏定义最后一行的反斜杠的位置的定义
(setq c-backslash-column 33)
;; 对于反斜杠进行连接的代码，自动对齐最后的反斜杠
(setq c-auto-align-backslashes t)

;; (add-to-list 'c-cleanup-list 'space-before-funcall)
;; (add-to-list 'c-cleanup-list 'brace-else-brace)

;; (defvar astyle-command "astyle")


(defun astyle-region (start end) 
  "Run astyle on region, formatting it in a pleasant way." 
  (interactive "r")
  (progn
    (if (eq system-type 'darwin) ;; mac specific settings
        (defvar astyle-command "/usr/local/Cellar/gnu-indent/2.2.10/bin/gindent")
      (defvar astyle-command "indent")
      )

    (defvar astyle-command "indent")
    (save-excursion 
      (shell-command-on-region start end
                               astyle-command
                               nil t
                               ;; 错误信息显示buffer
                               (get-buffer-create "*Astyle Errors*") t) 
      )
    (if (string= "c-mode" major-mode)
        (progn
          (c-mode)
          (emaci-mode-on))
      ))
  )

(defun astyle-buffer () 
  "Run astyle on whole buffer, formatting it in a pleasant way." 
  (interactive) 
  (save-excursion 
    (astyle-region (point-min) (point-max)))) 


;; format current c buffer
(defun refine-current-c-buffer ()
  "refine current c buffer using indent and cc-mode"
  (interactive)
  (save-excursion
    (astyle-buffer)
    (indent-region (point-min) (point-max)))
  )


;; TODO: 增加保存未格式化的文件的功能
;; 增加文件是只读文件的判断
;; format a file or a dir's all c files
(defun refine-dir-c-files (file-or-dir)
  "refine a file or a dir's all c files"
  (interactive "fRefine-files:\n")
  (save-excursion
    (let ((refine-filename nil)
          (refine-dirname nil)
          (refine-buffername nil)
          (original-buffername (current-buffer))
          )
      
      (if (string= "" file-or-dir)      ;argument is null
          (setq refine-filename (buffer-file-name))
        (setq refine-dirname (file-name-directory file-or-dir))
        )

      ;; do refine
      (setq refine-buffername (find-file "~/a.c"))
      (refine-current-c-buffer)
      (save-buffer refine-buffername)
      (kill-buffer refine-buffername)
      (switch-to-buffer original-buffername)
      (message "all refine is done: %s" refine-dirname)
      )
    )
  )



(add-hook 'c-mode-common-hook 
          '(lambda ()
             ;; indent region
             (define-key c-mode-map "\C-cir" 'astyle-region)
             ;; 注释在变量后面的33列，这个跟indent.pro里面的--declaration-comment-columnn类似
             (setq comment-column 33)
             ;; (define-key c-mode-map "\C-cir" 'indent-region)
             ;; indent buffer
             ;; (define-key c-mode-map "\C-cib" 'astyle-buffer)
             (define-key c-mode-map "\C-cib" 'refine-current-c-buffer)
              ;indent function
             (define-key c-mode-map "\C-cif" 'c-indent-defun)
             
             (define-key c++-mode-map "\C-cir" 'astyle-region) 
             (define-key c++-mode-map "\C-cib" 'refine-current-c-buffer)))

;; define my own c style
;; (defconst vinurs-c-style
;;   '((c-tab-always-indent        . t)
;;     (c-comment-only-line-offset . 4)

;;     (c-hanging-braces-alist     . ((substatement-open after)
;;                                    (brace-list-open)))
;;     (c-hanging-colons-alist     . ((member-init-intro before)
;;                                    (inher-intro)
;;                                    (case-label after)
;;                                    (label after)
;;                                    (access-label after)))
;;     (c-cleanup-list             . (scope-operator
;;                                    empty-defun-braces
;;                                    defun-close-semi))
;;     (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
;;                                    (substatement-open . 0)
;;                                    (case-label        . 4)
;;                                    (block-open        . 0)
;;                                    (knr-argdecl-intro . -)))
;;     (c-echo-syntactic-information-p . t))
;;   "vinurs C Programming Style")
;; (c-add-style "vinurs c style" vinurs-c-style)

;;; vinurs-astyle.el ends here
