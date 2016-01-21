;;; vinurs-c-settings.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-c-settings.el,v 0.0 2011/02/20 01:55:58 victor Exp $
;; Changed: <vinurs 01/21/2016 14:16:51>
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
;;   (require 'victor-c-settings)




;;; Code:

(provide 'vinurs-c-settings)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; c语言相关的所有配置

;; 缩进相关
(require 'vinurs-indent)

;; 自动给你加上括号,包括大括号
(require 'vinurs-electric-pair)



(require 'zjl-hl)
;;(c-default-style (quote ((c-mode . "") (c++-mode . ""))))
;; (c-mode-hook (quote (semantic-default-c-setup zjl-hl-enable-global-all-modes)))


(eal-define-keys
 `(c-mode-base-map)
 `(;;("C-h"     c-electric-backspace)
   ("C-c M-a" beginning-of-defun)
   ("C-c M-e" end-of-defun)
   ("C-c M-F" copy-current-fun-name)))


(defun cc-mode-settings ()
  "Settings for `cc-mode'."
  (defun c-mode-common-hook-settings ()
    "Settings for `c-mode-common-hook'."
    (c-set-style "awk")
    ;; 饥饿的删除键
    (c-toggle-hungry-state)
    ;; 对subword进行操作，而不是整个word
    ;;(subword-mode t)
	)
  (add-hook 'c-mode-common-hook 'c-mode-common-hook-settings)
  (add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
  (add-to-list 'auto-mode-alist '("\\.h$" . c-mode))



  ;; 快速include一个系统/用户头文件
  (mapc
   (lambda (mode)
     (define-abbrev-table mode '(("incs" "" skeleton-include 1)))
     (define-abbrev-table mode '(("incu" "" skeleton-include-user 1))))
   '(c-mode-abbrev-table c++-mode-abbrev-table))

  ;; 输入incy,可以自动提示输入文件名称,可以自动补全.
  (define-skeleton skeleton-include
    "产生#include<>" "" > "#include <"
    (completing-read "包含系统头文件: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    system-head-file-dir)))) ">\n")
  (define-skeleton skeleton-include-user
    "产生#include\"\"" "" > "#include \""
    (completing-read "包含用户头文件: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    user-head-file-dir)))) "\"\n")

  ;; (defvar c/c++-hightligh-included-files-key-map nil)
  ;; (unless c/c++-hightligh-included-files-key-map
  ;;   (setq c/c++-hightligh-included-files-key-map (make-sparse-keymap))
  ;;   (define-key-list
  ;;     c/c++-hightligh-included-files-key-map
  ;;     `(("<RET>"    find-file-at-point)
  ;;       ("<return>" find-file-at-point))))

  ;; (defun c/c++-hightligh-included-files ()
  ;;   (interactive)
  ;;   (when (or (eq major-mode 'c-mode)
  ;;             (eq major-mode 'c++-mode))
  ;;     (save-excursion
  ;;       (goto-char (point-min))
  ;;       ;; remove all overlay first
  ;;       (mapc (lambda (ov) (if (overlay-get ov 'c/c++-hightligh-included-files)
  ;;                              (delete-overlay ov)))
  ;;             (overlays-in (point-min) (point-max)))
  ;;       (while (re-search-forward "^[ \t]*#include[ \t]+[\"<]\\(.*\\)[\">]" nil t nil)
  ;;         (let* ((begin  (match-beginning 1))
  ;;                (end (match-end 1))
  ;;                (ov (make-overlay begin end)))
  ;;           (overlay-put ov 'c/c++-hightligh-included-files t)
  ;;           (overlay-put ov 'keymap c/c++-hightligh-included-files-key-map)
  ;;           (overlay-put ov 'face 'underline))))))
  ;; ;; 这不是一个好办法，也可以把它加载到c-mode-hook or c++-mode-hook中
  ;; (setq c/c++-hightligh-included-files-timer (run-with-idle-timer 0.5 t 'c/c++-hightligh-included-files))


  ;; (defalias 'cpp-mode 'c++-mode)
  )

(require 'vgtags)

(eval-after-load "cc-mode"
  `(cc-mode-settings))

(add-hook 'c-mode-common-hook
	  (lambda()
	    (c-set-offset 'inextern-lang 0)))



;;; victor-c-settings.el ends here
