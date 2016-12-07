;;; config.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)config.el,v 0.0 2016/08/26 16:55:31 vinurs Exp $
;; Changed: <vinurs 12/07/2016 08:14:16>
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
;;   (require 'config)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(push "~/.spacemacs.d/layers/vinurs-org" load-path) 

;; 加载了orgmode以后加载下面的代码
(with-eval-after-load 'org

  ;; here goes your Org config :)
  ;; org-mode, 自动换行
  (add-hook 'org-mode-hook
	(lambda () (setq truncate-lines nil))) 
  ;; org文件里面的代码块高亮
  (setq org-src-fontify-natively t) 

  ;; 对于org文档里面的不可见部分也能显示
  (setq org-catch-invisible-edits 'show) 
  

  ;; 设置pandoc把org导成pdf的时候的参数
  (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")
											;; 字体配置
											(variable . "mainfont=STKaiti")
											)) 

  ;; spacemacs里面的标题级别显示的符号，很漂亮
  (setq org-bullets-bullet-list '("✹" "✤" "✪" "❈" "✬"
								   "✭" "❀" "⇍" "☛"
								   "⤁" "⤘" ))

  ;; ;; 设置每个项目相关的todo list在每个项目的根目录下面
  ;; (setq-default dotspacemacs-configuration-layers
  ;; 	'((org :variables org-projectile-file "TODOs.org"))) 
  ;; (with-eval-after-load 'org-agenda
  ;; 	(require 'org-projectile)
  ;; 	(push (org-projectile:todo-files) org-agenda-files)) 
  ;; (add-to-list 'org-capture-templates (org-projectile:project-todo-entry)) 

  ;; orgmode todo
  (require 'org-todo) 


  )






(provide 'config)

;;; config.el ends here
