;;; victor-code-folding.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-code-folding.el,v 0.0 2011/03/19 23:47:23 victor Exp $
;; Changed: <victor 06/19/2011 13:41:58>
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
;;   (require 'victor-code-folding)




;;; Code:

(provide 'victor-code-folding)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



;; set C-c f 为代码折叠的前缀
(define-prefix-command 'ctl-c-f-map)
(global-set-key (kbd "C-c f") 'ctl-c-f-map)

;;代码折叠

;; hs-minor-mode相关的绑定
(load "victor-hs-minor-mode-settings")

;; semantic的折叠
;; (global-set-key (kbd "C-c f c") 'semantic-tag-folding-fold-block)
;; (global-set-key (kbd "C-c f C") 'semantic-tag-folding-show-block)


;; hide ifdef

;; hide all ifdefs
(global-set-key (kbd "C-c f e") 'hide-ifdefs)
;; show all ifdefs
(global-set-key (kbd "C-c f E") 'show-ifdefs)

(require 'ifdef)
(require 'ifdef-settings)

;; 编辑Ｃ文件的时候自动激活hide-ifdef-mode
(require 'hideif)
(setq hide-ifdef-initially nil)
(add-hook 'c-mode-common-hook
(lambda ()
(hide-ifdef-mode 1)
))


;; 首先是一个小函数，把所有的 #if 0 包含的代码给折叠起来。
(defun my-hide-if-0()
"hide #if 0 blocks, inspired by inte.NET. --lgfang"
(interactive)
(require 'hideif)
(save-excursion
(goto-char (point-min))
(while (re-search-forward "^[ \t]*#if[ \t]*0" nil t) (hide-ifdef-block))
)
)
; 把它加到 c-mode 的 hook 里，这样每次打开一个 c 文件， #if 0 就自动被折叠起来：
(add-hook 'c-mode-hook 'my-hide-if-0)
(add-hook 'c++-mode-hook 'my-hide-if-0)

(add-hook 'c-mode-common-hook
(lambda ()
(define-key c-mode-base-map (kbd "C-c f i") 'my-hif-toggle-block)
))

;;; for hideif
(defun my-hif-toggle-block ()
  "toggle hide/show-ifdef-block --lgfang"
  (interactive)
  (require 'hideif)
  (let* ((top-bottom (hif-find-ifdef-block))
		 (top (car top-bottom)))
	(goto-char top)
	(hif-end-of-line)
	(setq top (point))
	(if (hif-overlay-at top)
		(show-ifdef-block)
	  (hide-ifdef-block))))

(defun hif-overlay-at (position)
  "An imitation of the one in hide-show --lgfang"
  (let ((overlays (overlays-at position))
		ov found)
	(while (and (not found) (setq ov (car overlays)))
	  (setq found (eq (overlay-get ov 'invisible) 'hide-ifdef)
			overlays (cdr overlays)))
	found))


;; hide region
(require 'hide-region)

(eal-define-keys-commonly
 global-map
 `(("C-c f r" hide-region-hide)
   ("C-c f R" hide-region-unhide)
   ("C-p" hide-region-previous-line)
   ("C-n" hide-region-next-line)))

(defun hide-region-settings ()
  "Settings for `hide-region'."
  (setq hide-region-before-string "[======================该区域已")
  (setq hide-region-after-string "被折叠======================]\n"))

(eval-after-load "hide-region"
  `(hide-region-settings))


;;; victor-code-folding.el ends here
