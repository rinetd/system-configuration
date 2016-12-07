;;; vinurs-org-todo.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)org-todo.el,v 0.0 2016/10/19 22:50:11 vinurs Exp $
;; Changed: <vinurs 12/08/2016 21:59:24>
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


;; 把这个目录下面的全部包含进来
(setq org-directory "~/Dropbox/home/.org-agenda") 
(setq org-agenda-files `(,org-directory)) 


;; capture模板, 快速记录任务的时候
(setq org-capture-templates
  '(
	 ("a" "搜集所有未分类的任务" entry
	   (file+headline "~/Dropbox/home/.org-agenda/inbox.org" "Tasks")
	   "* %?\n 收集于: %U\n %i\n") 
	 ("b" "读书清单" entry 
	   (file+headline
		 "~/Dropbox/home/.org-agenda/books.org"
		 "Books")
	   "* TODO %?\n  添加于: %U\n %i\n\n"
	   :empty-lines 1)

	 ("s" "购物清单" entry 
	   (file+headline
		 "~/Dropbox/home/.org-agenda/shopping.org"
		 "ShoppingList")
	   "* TODO %?\n  添加于: %U\n %i\n\n"
	   :empty-lines 1)
	 ("l" "生活相关" entry 
	   (file+headline
		 "~/Dropbox/home/.org-agenda/life.org"
		 "ShoppingList")
	   "* TODO %?\n  添加于: %U\n %i\n\n"
	   :empty-lines 1)

	 ("w" "工作相关" entry
	   (file+headline "~/Dropbox/home/.org-agenda/work.org" "Tasks")
	   "* TODO %?\n %U\n" :clock-in t :clock-resume t)
	 ("p" "周期性任务" entry
	   (file+headline "~/Dropbox/home/.org-agenda/periodical-task.org" "Tasks")
	   "* TODO %?\n  %U\n %i\n")
	 ("i" "自我提升" entry
	   (file+headline "~/Dropbox/home/.org-agenda/self-improvement.org" "Tasks")
	   "* TODO %?\n  %U\n %i\n")
	 )) 

;; 任务太多完成以后归档的文件
(setq org-archive-location "%s_archive::* Archive")

;; 提前2天提醒
(setq org-deadline-warning-days 2)

;; appt配置
(setq appt-audible t) 
;; 任务开始前的多长时间开始提醒，以分钟为单位
(setq appt-message-warning-time 10)
;; 提醒持续时间（秒）
(setq appt-display-duration '30)
;;在状态栏显示时间（分钟）
(setq appt-display-mode-line t)


;; (setq org-capture-templates
;;   (quote (("i" "idea" entry (file (concat org-directory "/idea.org"))
;; 			"*  %^{Title} %?\n%U\n%a\n")
;; 		   ("t" "todo" entry (file (concat org-directory "/gtd.org"))
;; 			 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
;; 		   ("n" "note" entry (file (concat org-directory "/note.org"))
;; 			 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
;; 		   ("j" "Journal" entry (file+datetree (concat org-directory "/journal.org"))
;; 			 "*  %^{Title} %?\n%U\n%a\n" :clock-in t :clock-resume t)
;; 		   ("b" "Book" entry (file+datetree \t \t (concat org-directory "/book.org"))
;; 			 "* Topic: %^{Description}  %^g %? Added: %U") 
		   
;; 		   )))

;; keywords定义,括号里面为缩写,@表示状态改变的时候记一个笔记，
;; 添加笔记和状态变更信息(包括时间信息)，用"@"表示
;; 只添加状态变更信息，用"!"表示，！表示状态改变的时候加个时间戳
;; 这个通过定义带快速选择键的关键词时，在快速选择键后用"X/Y"来表示，X表示进入该状态时的动作，Y表示离开该状态时的动作。对于一个状态(以"DONE"为例)，以下形式都是合法的:
;; DONE(d@)       ; 进入时添加笔记
;; DONE(d/!)      ; 离开时添加变更信息
;; DONE(d@/!)     ; 进入时添加笔记，离开时添加变更信息
;; http://www.zmonster.me/2015/07/15/org-mode-planning.html#orgheadline2参照这里的解释
(setq org-todo-keywords
  '(
	 ;; 通用GTD流程
	 (sequence "TODO(t@/!)" "|" "DONE(d@/!)")
	 ;; bug处理流程
	 (sequence "REPORT(r@/!)" "BUG(b@/!)" "KNOWNCAUSE(k@/!)" "|" "FIXED(f@/!)")
	 (sequence "|" "CANCELED(c@/!)")
	 (sequence "|" "ABORT(a@/!)")
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






(provide 'vinurs-org-todo)

;;; org-todo.el ends here
