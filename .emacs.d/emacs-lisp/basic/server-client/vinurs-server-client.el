;;; vinurs-server-client.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-server-client.el,v 0.0 2013/02/18 19:25:17 vinurs Exp $
;; Changed: <vinurs 08/27/2013 10:10:42>
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
;;   (require 'vinurs-server-client)




;;; Code:

(provide 'vinurs-server-client)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 启用emacsclient
;;(server-start)

;;(add-hook 'server-switch-hook
 ;;         (lambda ()
  ;;          (unless (find-if (lambda (f)
;;                               (let ((p (frame-parameters f)))
;;                                 (assq 'window-system p)))
;;                             (frame-list))
;;              (make-frame-on-display (getenv "DISPLAY")))))

;; (setq server-window (selected-frame))
;;(add-hook 'server-visit-hook   
 ;;           '(lambda ()   
  ;;            (setq server-window (make-frame))))) 

;; 在client、server模式下用c-x k来代替原来的c-x #
;; (add-hook 'server-switch-hook 
;;   (lambda ()
;;     (local-set-key (kbd "C-x k") '(lambda ()
;;                                     (interactive)
;;                                     (server-edit)
;;                                     ))))



;;; vinurs-server-client.el ends here
