;;; victor-hs-minor-mode-settings.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-hs-minor-mode-settings.el,v 0.0 2011/06/19 13:16:21 victor Exp $
;; Changed: <vinurs 03/25/2013 10:41:24>
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
;;   (require 'victor-hs-minor-mode-settings)




;;; Code:

(provide 'victor-hs-minor-mode-settings)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(load-library "hideshow")
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



;; 这里貌似会自动关闭hl-line-mode
(defun vinurs-hs-toggle-hiding ()
  (interactive)
  "if hl-line-mode is off, then on it"
  (hs-toggle-hiding)
  ;; (hl-line-mode 1)
  ;; (if (not (hl-line-mode))
  ;;     (hl-line-mode))
  )

;;折叠块
(global-set-key (kbd "C-c f b") 'hs-toggle-hiding)
;; (global-set-key (kbd "C-c f b") 'vinurs-hs-toggle-hiding)

;; 开启高亮当前行功能
;; (global-hl-line-mode 1)


;;; victor-hs-minor-mode-settings.el ends here
