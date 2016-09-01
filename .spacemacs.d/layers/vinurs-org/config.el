;;; config.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)config.el,v 0.0 2016/08/26 16:55:31 vinurs Exp $
;; Changed: <vinurs 08/31/2016 18:08:17>
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


;; org-mode, 自动换行
(add-hook 'org-mode-hook
  (lambda () (setq truncate-lines nil))) 

;; org文件里面的代码块高亮
(setq org-src-fontify-natively t) 

;; 对于org文档里面的不可见部分也能显示
(setq org-catch-invisible-edits 'show) 

;; 在org-mode里面移动相关
(add-hook 'org-mode-hook
  '(lambda ()
	 (spacemacs/set-leader-keys-for-major-mode 'org-mode
	   "g n" 'outline-next-visible-heading) 
	 (spacemacs/set-leader-keys-for-major-mode 'org-mode
	   "g p" 'outline-previous-visible-heading) 
	 (spacemacs/set-leader-keys-for-major-mode 'org-mode
	   "g f" 'org-forward-heading-same-level) 
	 (spacemacs/set-leader-keys-for-major-mode 'org-mode
	   "g b" 'org-backward-heading-same-level) 
	 (spacemacs/set-leader-keys-for-major-mode 'org-mode
	   "g u" 'outline-up-heading) 
	 (spacemacs/set-leader-keys-for-major-mode 'org-mode
	   "g j" 'org-goto) 
	 
	 )) 




(provide 'config)

;;; config.el ends here
