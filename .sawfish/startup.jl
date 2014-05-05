;;; startup.jl --- 

;; Copyright 2012 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)startup.jl 0.0 2012/03/29 13:13:20 vinurs Exp $
;; Changed: <vinurs 01/22/2014 20:00:46>
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
;;   (require 'startup)




;;; Code:

(provide 'startup)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



;; 开机的时候自动启动的程序
;; 其实里面暂时只有xmodmap
(run-safely "xwindow-startup.sh")

;; 开启notify工具，这样我就可以定时提示一些信息了
(run-safely "/usr/libexec/notification-daemon")

;; 启动dropbox
;; (run-safely "proxychains dropbox start -i >/dev/null 2>&1")


;; 运行conky
;; (run-safely "conky")

;; ;; 先启动emacs，这个消耗的时间比较长
;; (jump-or-exec-emacs)

;; ;; urxvt启动,这里最好加上tmux的启动
(jump-or-exec-urxvt-tmux)


;; 启动chrome浏览器,在这之前最好把翻墙的启动了
(jump-or-exec-chrome)

;; 启动nevernote
;; (jump-or-exec-nevernote)



;;; startup.jl ends here
