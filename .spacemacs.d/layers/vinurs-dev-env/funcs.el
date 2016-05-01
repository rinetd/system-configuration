;;; funcs.el --- gtags functions File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defun helm-gtags-dwim-other-window ()
  "helm-gtags-dwim in the other window"
  (interactive)
  (let ((helm-gtags--use-otherwin t)
        (split-height-threshold nil)
        (split-width-threshold 140))
    (helm-gtags-dwim)))

(defun spacemacs/helm-gtags-define-keys-for-mode (mode)
  "Define key bindings for the specific MODE."
  (when (fboundp mode)
    (let ((hook (intern (concat (symbol-name mode) "-hook"))))
      (add-hook hook 'helm-gtags-mode)
	(ggtags-mode 1))
    (spacemacs/set-leader-keys-for-major-mode mode
      "gc" 'ggtags-create-tags 
      "gd" 'ggtags-find-definition
      ;;"gf" 'helm-gtags-select-path
      "gg" 'ggtags-find-tag-dwim
      ;; "gG" 'helm-gtags-dwim-other-window
      ;; "gi" 'helm-gtags-tags-in-this-function
      "gl" 'helm-gtags-parse-file
      "gn" 'helm-gtags-next-history
      "gp" 'pop-tag-mark
      "gr" 'ggtags-find-reference
      ;; "gR" 'helm-gtags-resume
      ;; "gs" 'helm-gtags-select
      ;; "gS" 'helm-gtags-show-stack
      "gu" 'ggtags-update-tags)))

(defun spacemacs/ggtags-enable-eldoc (mode)
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            (lambda ()
              (ggtags-mode 1)
              (eldoc-mode 1)
              (setq-local eldoc-documentation-function
                          #'ggtags-eldoc-function))))

;; Create my personal style.
(defconst vinurs-c-style
  '(
    ;; c的缩进为４个空格
    (c-basic-offset . 4)
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

;; Customizations for all modes in CC Mode.
(defun vinurs-c-mode-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "vinurs")
  ;; other customizations
  ;; we like auto-newline, but not hungry-delete
  ;; (c-toggle-auto-newline 1)
  )
(add-hook 'c-mode-hook 'vinurs-c-mode-hook)






