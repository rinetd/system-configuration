;;; org-todo.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)org-todo.el,v 0.0 2016/10/19 22:50:11 vinurs Exp $
;; Changed: <vinurs 10/20/2016 06:25:53>
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
;;   (require 'org-todo)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



;; keywords定义,括号里面为缩写,@表示状态改变的时候记一个笔记，！表示状态改变的时候加个时间戳
(setq org-todo-keywords
  '(
	 (sequence "TODO(t)" "|" "DONE(d@/!)")
	 (sequence "REPORT(r@/!)" "BUG(b@/!)" "KNOWNCAUSE(k@/!)" "|" "FIXED(f@/!)")
	 (sequence "|" "CANCELED(c@/!)")
	 )) 



;; 关键字的字体设置
(setq org-todo-keyword-faces
  '(
	 ("TODO" .      (:inherit hl-todo :foreground "#cc9393"))
	 ("STARTED" . "yellow")
	 ("CANCELED" . (:foreground "blue" :weight bold))
	 ("工作" .      (:background "red" :foreground "white" :weight bold))
	 ("学习" .      (:background "white" :foreground "red" :weight bold))
	 ("休闲" .      (:foreground "MediumBlue" :weight bold)) 
	 ("PENDING" .   (:background "LightGreen" :foreground "gray" :weight bold))
	 ("DONE" .      (:background "azure" :foreground "Darkgreen" :weight bold)) 
	 ("ABORT" .     (:background "gray" :foreground "black"))
	 )) 


;; 定义标签
(setq org-tag-alist (quote ((:startgroup)
							 ("@errand" . ?e)
							 ("@office" . ?o)
							 ("@home" . ?H)
							 ("@farm" . ?f)
							 (:endgroup)
							 ("WAITING" . ?w)
							 ("HOLD" . ?h)
							 ("PERSONAL" . ?P)
							 ("WORK" . ?W)
							 ("FARM" . ?F)
							 ("ORG" . ?O)
							 ("NORANG" . ?N)
							 ("crypt" . ?E)
							 ("NOTE" . ?n)
							 ("CANCELLED" . ?c)
							 ("FLAGGED" . ??))))

;; 记录下整个TODO list的所有状态改变的时间
;; 设置后每次将任务改变为 DONE 状态时在任务下添加一行内容 CLOSED: [timestamp]
;; 而再将 DONE 状态改为 TODO 时该行内容被自动删除。
(setq org-log-done 'time)

;; TODO
;; 如果项目结束时你还想对它写点评价子类的话，可以设置
;; 这样每次任务结束时Org就会提示你输入备注，并把它放到“Closing Note”标题下。
(setq org-log-done 'note)


;; 目前所有gtd相关的都存放在这个目录下面
(setq org-agenda-files
  (list
	"~/Dropbox/home/.org-agenda/inbox.org" ;; 要做的事情
	"~/Dropbox/home/.org-agenda/trash.org" ;; 被删除的事情
	"~/Dropbox/home/.org-agenda/finished.org" ;; 已完成的事情
	)) 




(provide 'org-todo)

;;; org-todo.el ends here
