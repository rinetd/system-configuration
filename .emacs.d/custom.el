;;; custom.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)custom.el,v 0.0 2011/04/26 05:35:58 victor Exp $
;; Changed: <vinurs 10/30/2014 10:02:31>
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
;;   (require 'custom)




;;; Code:


(provide 'custom)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################
;;由菜单修改配置的东西将会保存在custom-file里
(setq custom-file "~/.emacs.d/custom.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#dddd00")
 '(vc-follow-symlinks nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((((type tty) (class color)) (:foreground "black" :background "green" :inherit)) (((type graphic) (class color)) (:background "red" :foreground "black")) (t (:foreground "blue" :background "black"))))
 '(linum ((((type tty) (class color)) (:foreground "black" :background "white" :inherit)) (((type graphic) (class color)) (:background "black" :foreground "white")) (t (:foreground "blue" :background "black")))))
