;;; vinurs-dot-emacs.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-doc-emacs.el,v 0.0 2011/03/22 11:05:27 victor Exp $
;; Changed: <vinurs 05/28/2014 09:32:09>
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
;;   (require 'victor-dot-emacs)




;;; Code:

(provide 'vinurs-dot-emacs)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;;TODO: 在el-get之前要增加一些最基本的函数，例如如何同时增加多个hook之类,这个函数在ahei-misc里面其实已经有了
;; 把要加载的文件的路径全部加载进去
(load "~/.emacs.d/emacs-lisp/my-lisps/vinurs-load-path.el")

(add-to-list 'load-path "~/.emacs.d/plugin")




;; 下面的这几个文件以后我要进行缩减的

;; 一些基本的小函数,抄自ahei的配置文件
(require 'ahei-misc)




;; 利用`eval-after-load'加快启动速度的库
;; 用eval-after-load避免不必要的elisp包的加载
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)

(require 'util)


;; 我自己的配置文件
;; 最基本的一些配置
(require 'vinurs-basic)
(setq scheme-program-name "guile")


;; custom
(load-file "~/.emacs.d/custom.el")

;; vinurs's macro
(load-file "~/.emacs.d/vinurs-macro.el")

;;global keybind
(load-file "~/.emacs.d/vinurs-gkeybind.el")


;; el-get
(load "~/.emacs.d/vinurs-pre-el-get.el")
(load "~/.emacs.d/vinurs-el-get.el")

;; for Developement
(load "vinurs-develope")



;; for mac or linux
(if (eq system-type 'darwin) ;; mac specific settings
    (load "~/.emacs.d/mac/vinurs-mac.el")
  (load "~/.emacs.d/linux/vinurs-linux.el")
  )

;; 

;;; vinurs-dot-emacs.el ends here
