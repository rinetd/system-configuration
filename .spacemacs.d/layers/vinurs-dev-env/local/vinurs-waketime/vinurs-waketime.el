;;; vinurs-waketime.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-waketime.el,v 0.0 2016/08/03 09:03:28 vinurs Exp $
;; Changed: <vinurs 08/16/2016 20:17:34>
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
;;   (require 'vinurs-waketime)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(require 'waketime-priv) 
;; TODO: 增加系统判断，mac os跟linux上面的安装路径应该不同吧
(setq wakatime-cli-path "/usr/local/bin/wakatime")

;; setq wakatime mode
(if (file-exists-p wakatime-cli-path)
  (global-wakatime-mode) 
  )


(provide 'vinurs-waketime)

;;; vinurs-waketime.el ends here
