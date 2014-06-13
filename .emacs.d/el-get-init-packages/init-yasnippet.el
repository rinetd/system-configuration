;;; init-yasnippet.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-yasnippet.el,v 0.0 2013/08/14 12:02:55 vinurs Exp $
;; Changed: <vinurs 06/13/2014 08:13:16>
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
;;   (require 'init-yasnippet)




;;; Code:

(provide 'init-yasnippet)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



(yas/global-mode 1)


;; 定义多个root-directory
(setq yas/root-directory '("~/.emacs.d/el-get/yasnippet/snippets"
                           "~/.emacs.d/el-get-init-packages/yasnippet/snippets"
                           ))
;; Map `yas/load-directory' to every element
(mapc 'yas/load-directory yas/root-directory)


;; 将yas/expand绑定到其他快捷键上
(global-set-key (kbd "C-;") 'yas/expand)

;;; init-yasnippet.el ends here
