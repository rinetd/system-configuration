;;; init-ace-isearch.el --- 

;; Copyright 2016 zhanghaiyuan
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)init-ace-isearch.el,v 0.0 2016/01/23 11:18:38 vinurs Exp $
;; Changed: <vinurs 01/23/2016 11:52:21>
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
;;   (require 'init-ace-isearch)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; (ace-isearch-mode +1)
;; (global-ace-isearch-mode +1)

;; (global-ace-isearch-mode +1)

;; (custom-set-variables
;;  '(ace-isearch-input-length 7)
;;  '(ace-isearch-jump-delay 0.25)
;;  '(ace-isearch-function 'avy-goto-char)
;;  '(ace-isearch-use-jump 'printing-char))

;; (define-key isearch-mode-map (kbd "C-'") 'ace-isearch-jump-during-isearch)


;; (setq ace-isearch-funtion-from-isearch 'swoop-from-isearch)
;; (define-key swoop-map (kbd "C-s") 'swoop-action-goto-line-next)
;; (define-key swoop-map (kbd "C-r") 'swoop-action-goto-line-prev)
;; (setq ace-isearch-funtion-from-isearch 'helm-occur-from-isearch)

;; (defun my-fallback-function ()
;;   (message "Your isearch string is %s", isearch-string))

;; (setq ace-isearch-use-function-from-isearch t)
;; (setq ace-isearch-fallback-function 'my-fallback-function)



(provide 'init-ace-isearch)

;;; init-ace-isearch.el ends here
