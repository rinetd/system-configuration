;;; vinurs-gpg.el --- 

;; Copyright 2014 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-gpg.el,v 0.0 2014/11/10 20:05:32 vinurs Exp $
;; Changed: <vinurs 11/10/2014 22:35:20>
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
;;   (require 'vinurs-gpg)




;;; Code:

(provide 'vinurs-gpg)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; enable gpg mode
(epa-file-enable)

;;对称加密方式
(setq epa-file-encrypt-to nil)

;;保存密码, 那样就不会每次保存都会要求你设置密码
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;;自动保存
(setq epa-file-inhibit-auto-save nil)



;;; vinurs-gpg.el ends here
