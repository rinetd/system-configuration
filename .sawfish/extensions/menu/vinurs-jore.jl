;;; vinurs-jore.jl --- 

;; Copyright 2012 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-jore.jl 0.0 2012/08/01 16:58:28 vinurs Exp $
;; Changed: <vinurs 08/27/2013 21:03:32>
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
;;   (require 'vinurs-jore)




;;; Code:

(provide 'vinurs-jore)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;;; jump-or-exec
(require 'menu.Jump-or-exec)

;; 这里应该修改成根据列表自动生成下面的几个函数以及他们的键绑定
;; 自动生成那几个jump-or-exec的函数
;; (defvar kid-jump-or-exec-list
;;   '(("H-t" "mlterm" "ssh-agent mlterm &")
;;     ("H-y" "remote" "ssh-agent mlterm -T remote&")
;;     ("H-f" "Swiftfox" "swiftfox &")
;;     ("H-r" "^~" "rox &")
;;     ("H-c" "xCHM" "xchm &")
;;     ("H-d" "Xpdf" "xpdf &")
;;     ("H-v" "GVIM" "gvim &")
;;     ("H-q" "QQ" "qq &")
;;     ("H-g" "gFTP" "gftp &")))

;; (mapc #'(lambda (x &rest y)
;;           (push (cons x y) res)
;;           )
;;       '(1 2 3 4) '(5 6 7 8)
;;       )

;; (defvar vinurs-jump-or-exec-list
;;   '(("Super-e" "emacs" "emacs")
;;     ("Super-g" "chrome" "google-chrome")
;;     )

;; (cons '(a) '(b))
;; (car '(rose violet daisy buttercup))
;; (cdr '(rose violet daisy buttercup))
;; (cons (car '(rose violet daisy buttercup)) (cdr '(rose violet daisy buttercup)))

;; (mapc #'(lambda (item)
;; 	  (bind-keys global-keymap
;; 		     (car item)
;; 		     `(jump-or-exec ,(cadr item)
;; 				    ,(lambda ()
;; 				       (kid-display-message (concat "starting "
;; 								    (caddr item)
;; 								    " ..."))
;; 				       (system (caddr item)))
;; 				    ,(lambda (wind)
;; 				       (display-window wind))))) kid-jump-or-exec-list)



;; 定义一些启动程序的快捷键

;; emacs启动的相关部分，要结合emacsclient来进行设置，参照了pluskid的代码
(defun jump-or-exec-emacs ()
  (interactive)
  (jump-or-exec "emacs@"                ; Emacs's title
                (lambda ()              ; When Emacs isn't running
                  (kid-display-message "starting Emacs ...")
                  ;; (run-safely "emacs ")
                  (run-safely "vinurs-emacs-x")
                  "sleep 1")
                (lambda (wind)          ; When already focused
                  (display-window wind))))
(bind-keys global-keymap
           "Super-e" 'jump-or-exec-emacs)



;; urxvt and tmux
;; 自动执行tmux，并且新开几个默认的窗口
(defun jump-or-exec-urxvt-tmux ()
  (interactive)
  (jump-or-exec "vinurs-tmux"
                (lambda()
                  (run-safely "urxvt -title 'vinurs-tmux' -e tmux.sh"))))
(bind-keys global-keymap
          "Super-u" 'jump-or-exec-urxvt-tmux)


;; google chrome
(defun jump-or-exec-chrome ()
  (interactive)
  (jump-or-exec "Google Chrome"                ; chrome's title
                  (lambda ()
                     (run-safely "google-chrome "))))
(bind-keys global-keymap
           "Super-g" 'jump-or-exec-chrome)

;; pidgin
(defun jump-or-exec-pidgin ()
  (interactive)
  (jump-or-exec "Buddy List"                ; pidgin's title
                  (lambda ()
                     (run-safely "pidgin "))))
(bind-keys global-keymap
           "Super-p" 'jump-or-exec-pidgin)

;; nevernote
(defun jump-or-exec-nevernote ()
  (interactive)
  (jump-or-exec "NixNote"                ; nevernote's title
                  (lambda ()
                     (run-safely "nixnote "))))
(bind-keys global-keymap
           "Super-n" 'jump-or-exec-nevernote)


;; emelfm2
(defun jump-or-exec-emelFM2 ()
  (interactive)
  (jump-or-exec "emelFM2"                ; emelFM2's title
                  (lambda ()
                     (run-safely vinurs-emelfm2))))
(bind-keys global-keymap
           "Super-f" 'jump-or-exec-emelFM2)








;;; vinurs-jore.jl ends here
