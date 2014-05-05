;;; vinurs-trivial.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-trivial.el,v 0.0 2013/02/07 12:51:16 vinurs Exp $
;; Changed: <vinurs 02/16/2013 11:27:39>
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
;;   (require 'vinurs-trivial)




;;; Code:

(provide 'vinurs-trivial)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 根据不同的后缀用不同的应用程序打开文件
(defun define-trivial-mode(mode-prefix file-regexp &optional command)
  (or command (setq command mode-prefix))
  (let ((mode-command (intern (concat mode-prefix "-mode"))))
    (fset mode-command
          `(lambda ()
             (interactive)
             (toggle-read-only t)
	     (start-process ,mode-prefix nil
			    ,command (buffer-file-name))
	     (let ((obuf (other-buffer (current-buffer) t)) ;; Select correct buffer
		   (kbuf (current-buffer)))
	       (set-buffer obuf)			    ;; set it as current
	       (kill-buffer kbuf))))			    ;; kill temporary buffer
    (add-to-list 'auto-mode-alist (cons file-regexp mode-command))))


;; 各种文件的打开方式
;; pdf的文件用evice打开
(define-trivial-mode "evince" "\\.pdf$")




;;; vinurs-trivial.el ends here
