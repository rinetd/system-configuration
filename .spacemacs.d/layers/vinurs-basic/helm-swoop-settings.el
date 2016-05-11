;;; helm-swoop-settings.el --- 

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)helm-swoop-settings.el,v 0.0 2016/05/11 16:52:23 vinurs Exp $
;; Changed: <victor 02/20/2011 11:29:30>
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
;;   (require 'helm-swoop-settings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(global-set-key (kbd "C-s") 'helm-swoop)

;; Move up and down like isearch
;;(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
;;(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
;;(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)


(provide 'helm-swoop-settings)

;;; helm-swoop-settings.el ends here
