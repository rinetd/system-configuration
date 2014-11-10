;;; gtd.el --- 

;; Copyright 2014 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)gtd.el,v 0.0 2014/11/08 11:09:06 vinurs Exp $
;; Changed: <vinurs 11/10/2014 08:49:57>
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
;;   (require 'gtd)




;;; Code:

(provide 'gtd)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################




;; org capture
(setq org-default-notes-file (concat org-directory "/gtd/inbox.org"))
(define-key global-map "\C-cc" 'org-capture)

;; 设置capture templates
(setq org-capture-templates
      '(
        ;; todo list
        ("t" "Todo entry" entry
         (file+headline "~/Dropbox/home/org/gtd/inbox.org" "Tasks")
         "* TODO [#C] %?\n  %i\n  %T")
        ;; note
        ))




;; 用Emacs Org来实现GTD
;; todo list
;; todo list 默认只有两种状态： TODO 和 DONE。我们可以再增加一些其他状态。
(setq org-todo-keywords
    '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
      ))

;; tags
(setq org-tag-alist '((:startgroup . nil)
                           ("@work" . ?w) ("@home" . ?h)
                           ("@tennisclub" . ?t)
                           (:endgroup . nil)
                           ("laptop" . ?l) ("pc" . ?p)))

;; Faces for TODO keywords
(setq org-todo-keyword-faces
  '(("工作" .      (:background "red" :foreground "white" :weight bold))
    ("学习" .      (:background "white" :foreground "red" :weight bold))
    ("休闲" .      (:foreground "MediumBlue" :weight bold)) 
    ("PENDING" .   (:background "LightGreen" :foreground "gray" :weight bold))
    ("TODO" .      (:background "DarkOrange" :foreground "black" :weight bold))
    ("DONE" .      (:background "azure" :foreground "Darkgreen" :weight bold)) 
    ("ABORT" .     (:background "gray" :foreground "black"))
    ))


;; 优先级范围和默认任务的优先级 A-D足够了，越多的优先级越不好控制
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?C)
(setq org-default-priority ?B)

;; 给优先级定制醒目外观
(setq org-priority-faces
      '((?A . (:background "red" :foreground "white" :weight bold))
        (?B . (:background "DarkOrange" :foreground "white" :weight bold))
        (?C . (:background "SkyBlue" :foreground "black" :weight bold))
        ))



;; (setq org-todo-keywords
;;       '((sequence "TODO" "DOING" "HANGUP" "|" "DONE" "CANCEL")))
;; 可以将 todo list 的状态增加为五种：TODO，DOING，HANGUP，DONE，CANCEL。
;; 注意，在 HANGUP 和 DONE 之间有一条竖线 “|”，在竖线之前的状态和之后的状态使用的是不同的face。

;; 进一步的，我们还可以记录切换到某一种状态时的时间：
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")))

;; (setq org-todo-keywords
;;        '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))




;;; gtd.el ends here
