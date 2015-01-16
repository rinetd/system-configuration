;;; victor-basic-functions.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-basic-functions.el,v 0.0 2011/06/06 22:39:07 victor Exp $
;; Changed: <victor 08/31/2011 07:38:06>
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
;;   (require 'victor-basic-functions)




;;; Code:

(provide 'vinurs-basic-functions)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; 不要重启emacs就可以更新它的配置,并且绑定到[F5]
(defun update-emacs-configuration ()
  (interactive)
  (save-excursion
	(load-file "~/.emacs")
	)
  )
(global-set-key (kbd "<f5>") 'update-emacs-configuration)


(defun dos2unix ()
  "消除dos文档中的"
  (interactive)
  (save-excursion
	(goto-char (point-min))
	(while (search-forward "" nil t)
	  (replace-match "" nil t)
	  )
	)
  )
;;(defun unix-dos () (interactive) (goto-char (point-min)) (while (search-forward "\n" nil t) (replace-match "\r\n")))




;;; victor-basic-functions.el ends here
