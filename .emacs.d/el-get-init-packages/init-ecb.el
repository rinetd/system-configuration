;;; init-ecb.el --- 

;; Copyright 2014 vinurs
;;
;; Author: vinurs@localhost.localdomain
;; Version: $Id: @(#)ini-ecb.el,v 0.0 2014/05/16 15:14:15 vinurs Exp $
;; Changed: <vinurs 10/30/2014 21:59:06>
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;ecb启动的时候会弹出一个提示窗口,如果不想看到它，可以在emacs配置文件(~/.emacs)里加这一句:
(setq ecb-tip-of-the-day nil)
(ecb-activate);;ecb启动的时候会弹出一个提示窗口,如果不想看到它，可以在emacs配置文件(~/.emacs)里加这一句:
(setq ecb-tip-of-the-day nil)
(ecb-activate);;ecb启动的时候会弹出一个提示窗口,如果不想看到它，可以在emacs配置文件(~/.emacs)里加这一句:
(setq ecb-tip-of-the-day nil)
(ecb-activate);;ecb启动的时候会弹出一个提示窗口,如果不想看到它，可以在emacs配置文件(~/.emacs)里加这一句:
(setq ecb-tip-of-the-day nil)
(ecb-activate);;
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
;;   (require 'ini-ecb)




;;; Code:

(provide 'ini-ecb)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; -------------------------------------------------------
;; |             |                         |             |
;; | Directories |                         |  taglist    |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |-------------|          Edit           |             |
;; |             |                         |             |
;; | Sources     |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; -------------------------------------------------------
;; |                                                     |
;; |                   Compilation                       |
;; |                                                     |
;; -------------------------------------------------------

(require 'ecb)
(ecb-layout-define "vinurs-layout" left-right
  nil
  ;; here we have an edit-window and left and right two windows each
  ;; with width `ecb-windows-width'. Dependent to the value of
  ;; `ecb-compile-window-height' we have also a compile-window at the
  ;; bottom.

  (ecb-set-directories-buffer)
  (ecb-split-ver 0.5 t)
  (select-window (next-window))
  (ecb-set-history-buffer)
  (select-window (next-window))
  (select-window (next-window))
  
  (ecb-set-sources-buffer)

  ;; select the edit-window.

)


;; 默认用我自己定义的layout
(setq ecb-layout-name "vinurs-layout")
(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.

  '(ecb-layout-window-sizes (quote (("vinurs-layout" (ecb-directories-buffer-name 0.21468926553672316 . 0.4883720930232558) (ecb-history-buffer-name 0.21468926553672316 . 0.4883720930232558) (ecb-sources-buffer-name 0.2542372881355932 . 0.9767441860465116)))))
 '(ecb-options-version "2.40"))


;;ecb启动的时候会弹出一个提示窗口,如果不想看到它，可以在emacs配置文件(~/.emacs)里加这一句:
(setq ecb-tip-of-the-day nil)
(ecb-activate)






;;; ini-ecb.el ends here
