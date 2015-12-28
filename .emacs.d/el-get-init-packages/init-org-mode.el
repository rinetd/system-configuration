;;; init-org-mode.el --- 

;; Copyright 2014 vinurs
;;
;; Author: vinurs@localhost.localdomain
;; Version: $Id: @(#)init-org-mode.el,v 0.0 2014/05/18 12:19:43 vinurs Exp $
;; Changed: <vinurs 11/08/2014 11:45:41>
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
;;   (require 'init-org-mode)




;;; Code:

(provide 'init-org-mode)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; basic
(setq org-directory "~/Dropbox/home/org/")


;; GTD
;; 最好的GTD，没有之一
(load "~/.emacs.d/el-get-init-packages/org-gtd.el")








;; 主要配置就是用来写blog，配合github
;; ;; Org-Mode发布设置
;; (require 'org-publish)

;; (defadvice org-html-paragraph (before org-html-paragraph-advice
;;                                       (paragraph contents info) activate)
;;   "Join consecutive Chinese lines into a single long line without
;; unwanted space when exporting org-mode to html."
;;   (let* ((origin-contents (ad-get-arg 1))
;;          (fix-regexp "[[:multibyte:]]")
;;          (fixed-contents
;;           (replace-regexp-in-string
;;            (concat
;;             "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))

;;     (ad-set-arg 1 fixed-contents)))

;; (setq org-publish-project-alist
;;       '(
;;       ("org-blog"
;;        :base-extension "org"
;;        :base-directory "~/program/vinurs.github.io/org/"
;;        :recursive t
;;        :publishing-function org-html-publish-to-html
;;        :auto-preamble t
;;        :headline-levels 4 
;;        :html-extension "html"
;;        :publishing-directory "~/program/vinurs.github.io/_posts/"
;;        :body-only t ;; Only export section between <body> </body>

;; )))



;; ;; (require 'org-install)


;; ;; ;; 让 .org的文件打开后默认进入 org mode
;; (add-to-list 'auto-mode-alist '("\.\(org\|org_archive\|txt\)$" . org-mode))
;; (setq org-log-done t)

;; (add-hook 'org-mode-hook
;;       (lambda () (setq truncate-lines nil)))


;; ;; 为了使用Org-mode的日程表功能，首先需要把todo.org加入到日程表文件中
;; ; 将~/org/todo.org替换为todo.org实际路径
;; (setq org-agenda-files (list (concat orgdd "todo.org")))
;; ;; (setq emelfm2 (concat "emelfm2 --config=" (getenv "HOME") "/.emelfm2"))


;; ;; 再绑定Org-mode日程表的快捷键。
;; ;; C-c o a (agenda)
;; (global-set-key "\C-coa" 'org-agenda)




;;; init-org-mode.el ends here
