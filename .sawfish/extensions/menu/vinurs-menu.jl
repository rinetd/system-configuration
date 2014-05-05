;;; vinurs-menu.jl --- 

;; Copyright 2012 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)vinurs-menu.jl 0.0 2012/03/27 20:05:18 vinurs Exp $
;; Changed: <vinurs 08/26/2013 20:15:01>
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
;;   (require 'victor-menu)




;;; Code:

(provide 'victor-menu)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; 我的jump or execute
(require 'menu.vinurs-jore)

(require 'sawfish.wm.menus)

;; 定义我自己的菜单
;; 获得系统环境变量
;; 获得HOME的绝对路径
;; 设置配置文件的路径,必须是绝对路径
;;(setq vinurs-emelfm2 (concat "emelfm2 --config=" (getenv "HOME") "/.emelfm2/ "))
;; 设置两个面板的初始目录
;; (setq vinurs-emelfm2 (concat vinurs-emelfm2 "--one=" (getenv "HOME") " --two=" (getenv "HOME") " "))
;; 追加回收站的路径,必须是绝对路径
;; (setq vinurs-emelfm2 (concat vinurs-emelfm2 "--trash=" (getenv "HOME") "/.Trash/"))

;; concat 命令行选项参数
;; emelfm2 --one=~ --two=~ --config=~/.emelfm2


;; 这个回收站后面指定的路径还必须是绝对路径


;; (kid-display-message emelfm2)

(setq apps-menu
      `(("Apps Menu" (system ""))
        ()
        ("dia" (run-safely "dia --integrated "))
        ("gvim" (run-safely "gvim "))
        ("vbox" (run-safely "virtualbox"))
        ("emacs" (jump-or-exec-emacs))
        ("terminal" (jump-or-exec-urxvt-tmux))
        ("chrome" (jump-or-exec-chrome))
        ("shutter" (run-safely "shutter"))
        ("pidgin" (jump-or-exec-pidgin))
        ;; ("emelfm2" (run-safely "emelfm2"))
        ("emelfm2" (run-safely vinurs-emelfm2))
        ("planner" (run-safely "planner"))
        ("nautilus" (run-safely "nautilus"))
        ("nevernote" (run-safely "nixnote"))
        ("reciteword" (run-safely "reciteword"))
        ("thunderbird" (run-safely "thunderbird"))
        ("gnome-terminal" (run-safely "gnome-terminal"))
        ))




;; (bind-keys global-keymap
;;            "S-m"  'popup-root-menu             ;C-menu键弹出根菜单
;;    )










;;; victor-menu.jl ends here
