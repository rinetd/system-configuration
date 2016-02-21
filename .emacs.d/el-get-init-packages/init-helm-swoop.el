;;; init-helm-swoop.el --- 

;; Copyright 2016 zhanghaiyuan
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)init-helm-swoop.el,v 0.0 2016/02/20 23:41:37 vinurs Exp $
;; Changed: <vinurs 02/21/2016 09:52:34>
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
;;   (require 'init-helm-swoop)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; 主动加载，要不然下面很多设置都不能设置
(require 'helm-swoop)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color t)

;; 替换掉系统的C-s，这个用起来更加方便
(global-set-key (kbd "C-s") 'helm-swoop)


;; (setq helm-swoop-use-line-number-face t)

;; ;; If nil, you can slightly boost invoke speed in exchange for text color
;; (setq helm-swoop-speed-or-color nil)


;; 设置匹配的时候的颜色
(set-face-attribute 'helm-swoop-target-word-face nil
					:background "cyan1" :foreground "gray0")

;; ;; Go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t)



(provide 'init-helm-swoop)

;;; init-helm-swoop.el ends here
