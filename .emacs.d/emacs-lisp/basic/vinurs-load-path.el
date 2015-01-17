;;; vinurs-load-path.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-load-path.el,v 0.0 2011/06/06 21:59:38 victor Exp $
;; Changed: <vinurs 01/17/2015 10:03:41>
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
;;   (require 'victor-load-path)




;;; Code:

(provide 'vinurs-load-path)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################






;; 定义路径前缀，后面用起来才方便
(defconst my-emacs-path-prefix           "~/.emacs.d/" "我的emacs相关配置文件的路径")

;;(defconst my-emacs-my-lisps-path  (concat my-emacs-path-prefix "emacs-lisp/my-lisps/") "我自己写的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path-prefix "emacs-lisp/") "我下载的emacs lisp包的路径")


;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(my-add-subdirs-to-load-path my-emacs-lisps-path)
;;(my-add-subdirs-to-load-path my-emacs-my-lisps-path)



 

;;; vinurs-load-path.el ends here
