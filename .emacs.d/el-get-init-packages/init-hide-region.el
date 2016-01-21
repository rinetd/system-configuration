;;; init-hide-region.el --- 

;; Copyright 2014 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-hide-region.el,v 0.0 2014/06/01 10:42:01 vinurs Exp $
;; Changed: <vinurs 01/21/2016 14:12:53>
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
;;   (require 'init-hide-region)




;;; Code:

(provide 'init-hide-region)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; hideif配置
(add-hook 'c-mode-common-hook
          (lambda ()
			;; 初始化
			(setq hide-ifdef-initially t)

			;; 下面这两行配置是比较好的,不仅仅能不显示无效的宏配置，连if 0也能正确处理
			;; 这样就不需要别的另外的设置了
			;; 无效代码变为灰色
			(setq hide-ifdef-shadow t)
			;; 无效代码被折叠隐藏变为...
			(setq hide-ifdef-shadow nil)

			;; 开启ifdef mode
            (setq hide-ifdef-mode t)
            (hide-ifdefs)
			(hide-ifdef-mode)

			;; 这里可以对hideif的键作一些重新绑定
			;; hideif键绑定都在hide-ifdef-mode-submap里面,
			;; prefix在hide-ifdef-mode-prefix-key里面"\C-c@"
			(define-key hide-ifdef-mode-submap "\C-e" 'show-ifdef-block)
            ))




;; hide/show setting


;; ;; hs-minor-mode settings
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)

;;全部折叠/展开
(global-set-key (kbd "C-c f a") 'hs-toggle-hiding-all)

(defvar hs-hide-all nil "Current state of hideshow for toggling all.")

(make-variable-buffer-local 'hs-hide-all)

(defun hs-toggle-hiding-all ()
  "Toggle hideshow all."
  (interactive)
  (setq hs-hide-all (not hs-hide-all))
  (if hs-hide-all
	  (hs-hide-all)
	(hs-show-all)))


(global-set-key (kbd "C-c f b") 'hs-toggle-hiding)



;; hide region
(eal-define-keys-commonly
 global-map
 `(("C-c f r" hide-region-hide)
   ("C-c f R" hide-region-unhide)
   ))

(defun hide-region-settings ()
  "Settings for `hide-region'."
  (setq hide-region-before-string "[======================该区域已")
  (setq hide-region-after-string "被折叠======================]\n"))

(eval-after-load "hide-region"
  `(hide-region-settings))






;;; init-hide-region.el ends here
