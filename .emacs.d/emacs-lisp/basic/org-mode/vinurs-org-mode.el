;;; vinurs-org-mode.el --- 

;; Copyright 2012 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-org-mode.el,v 0.0 2012/08/01 11:45:18 vinurs Exp $
;; Changed: <vinurs 08/01/2012 13:19:41>
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
;;   (require 'vinurs-org-mode)




;;; Code:

(provide 'vinurs-org-mode)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; org很不多的软件，好好积累配置文件
;; 设置org的默认路径，因为我所有的东西都放到dropbox里面去了，这样我就可以实时同步
;; (setq orgmode-default-dir "~/Dropbox/private/org/")
(setq orgdd "~/Dropbox/private/org/")

(require 'org-install)


;; 让 .org的文件打开后默认进入 org mode
(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\|txt\)$" . org-mode))
(setq org-log-done t)


;; todo list
;; todo list 默认只有两种状态： TODO 和 DONE。我们可以再增加一些其他状态。
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "HANGUP" "|" "DONE" "CANCEL")))
;; 可以将 todo list 的状态增加为五种：TODO，DOING，HANGUP，DONE，CANCEL。
;; 注意，在 HANGUP 和 DONE 之间有一条竖线 “|”，在竖线之前的状态和之后的状态使用的是不同的face。

;; 进一步的，我们还可以记录切换到某一种状态时的时间：
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")))


;; 为了使用Org-mode的日程表功能，首先需要把todo.org加入到日程表文件中
; 将~/org/todo.org替换为todo.org实际路径
(setq org-agenda-files (list (concat orgdd "todo.org")))
;; (setq emelfm2 (concat "emelfm2 --config=" (getenv "HOME") "/.emelfm2"))


;; 再绑定Org-mode日程表的快捷键。
;; C-c o a (agenda)
(global-set-key "\C-coa" 'org-agenda)


;; Org-Mode发布设置
(require 'org-publish)


;;; vinurs-org-mode.el ends here
