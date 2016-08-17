;;; config.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)config.el,v 0.0 2016/08/16 19:00:47 vinurs Exp $
;; Changed: <vinurs 08/17/2016 16:08:13>
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


;; add to load-path first
(push "~/.spacemacs.d/layers/vinurs-defaults/" load-path)


;; 设置hlt-highlight-symbol的颜色
(setq hlt-auto-face-backgrounds
  '("red" "green" "yellow" "blue" "magenta" "cyan"  "DeepPink"
	 "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" isearch
	 isearch-fail lazy-highlight mode-line mode-line-inactive next-error
	 nobreak-space secondary-selection tooltip trailing-whitespace
	 header-line mode-line-highlight "dark cyan" )
  ) 


(provide 'config)

;;; config.el ends here
