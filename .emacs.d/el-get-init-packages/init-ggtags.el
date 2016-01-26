;;; init-ggtags.el --- 

;; Copyright 2014 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-ggtags.el,v 0.0 2014/05/07 22:53:45 vinurs Exp $
;; Changed: <vinurs 01/26/2016 08:47:26>
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
;;   (require 'init-ggtags)




;;; Code:

(provide 'init-ggtags)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(add-hook 'c-mode-common-hook
		  (lambda ()
			(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
			  (ggtags-mode 1))))

(add-hook 'c-mode-common-hook
		  (lambda ()
			(progn
			  (ggtags-mode 1)
			  (global-set-key (kbd "C-c g p") 'pop-tag-mark)
			  (global-set-key (kbd "C-c g u") 'ggtags-update-tags)
			  (global-set-key (kbd "C-c g r") 'ggtags-find-reference)
			  (global-set-key (kbd "C-c g g") 'ggtags-grep)
			  (global-set-key (kbd "C-c g d") 'ggtags-show-definition)
			  (global-set-key (kbd "C-c g h") 'ggtags-view-search-history)
			  (define-key ggtags-mode-map (kbd "C-c g a") 'ggtags-navigation-mode-abort)
			  ;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
			  ;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)

			  ;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
			  ;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
			  ;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

			  (global-set-key (kbd "C-c g p") 'pop-tag-mark)

			  )
			))
		  

(defun gtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))
(defun gtags-update ()
  "Make GTAGS incremental update"
  (call-process "global" nil nil nil "-u"))
(defun gtags-update-hook ()
  (when (gtags-root-dir)
    (gtags-update)))
(add-hook 'after-save-hook #'gtags-update-hook)


;;; init-ggtags.el ends here
