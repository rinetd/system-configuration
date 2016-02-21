;;; init-helm.el --- 

;; Copyright 2016 zhanghaiyuan
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)init-helm.el,v 0.0 2016/02/20 02:26:14 vinurs Exp $
;; Changed: <vinurs 02/21/2016 09:16:59>
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
;;   (require 'init-helm)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(helm-mode 1)
;; 替换系统的M-x
(global-set-key (kbd "M-x") 'helm-M-x)


;; helm的buffer自动调整大小
(helm-autoresize-mode 1)
;; 替换系统的C-x C-f
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

;; 映射c-h为delete
(define-key helm-map (kbd "C-h") 'delete-backward-char)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)



(provide 'init-helm)

;;; init-helm.el ends here
