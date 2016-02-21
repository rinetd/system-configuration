;;; init-helm-projectile.el --- 

;; Copyright 2016 zhanghaiyuan
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)init-helm-projectile.el,v 0.0 2016/02/20 02:09:22 vinurs Exp $
;; Changed: <vinurs 02/20/2016 22:56:15>
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
;;   (require 'init-helm-projectile)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 默认全局使用
(projectile-global-mode)

(setq projectile-completion-system 'helm)
;; 用helm的命令来代替原来projectile的命令，这样就不用自己一个个替换了
(helm-projectile-on)


;; 默认打开缓存
(setq projectile-enable-caching t)

(setq projectile-indexing-method 'native)

(setq projectile-require-project-root nil)


;; C-c p g来grep
(define-key projectile-command-map (kbd "g") #'helm-projectile-grep)


;; 重新定义快捷键


(provide 'init-helm-projectile)

;;; init-helm-projectile.el ends here
