;;; vinurs-rainbow-delimiters-settings.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-rainbow-delimiters-settings.el,v 0.0 2016/12/29 14:31:37 vinurs Exp $
;; Changed: <vinurs 12/29/2016 14:36:11>
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
;;   (require 'vinurs-rainbow-delimiters-settings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.

   '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
   '(rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
   '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow"))))
   '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
   '(rainbow-delimiters-depth-5-face ((t (:foreground "blue"))))
   '(rainbow-delimiters-depth-6-face ((t (:foreground "violet"))))
   '(rainbow-delimiters-depth-7-face ((t (:foreground "purple"))))
   '(rainbow-delimiters-depth-8-face ((t (:foreground "black"))))
   '(rainbow-delimiters-depth-9-face ((t (:foreground "cyan"))))
   '(rainbow-delimiters-unmatched-face ((t (:background "cyan"))))

   ) 

;; (custom-set-faces
;;    ;; custom-set-faces was added by Custom.
;;    ;; If you edit it by hand, you could mess it up, so be careful.
;;    ;; Your init file should contain only one such instance.
;;    ;; If there is more than one, they won't work right.

;;    '(rainbow-delimiters-depth-1-face ((t (:foreground "red" :height 2.0))))
;;    '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :height 1.8))))
;;    '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow" :height 1.6))))
;;    '(rainbow-delimiters-depth-4-face ((t (:foreground "green" :height 1.4))))
;;    '(rainbow-delimiters-depth-5-face ((t (:foreground "blue" :height 1.2))))
;;    '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :height 1.1))))
;;    '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :height 1.0))))
;;    '(rainbow-delimiters-depth-8-face ((t (:foreground "black" :height 0.9))))
;;    '(rainbow-delimiters-unmatched-face ((t (:background "cyan" :height 0.8))))

;;    ) 



(provide 'vinurs-rainbow-delimiters-settings)

;;; vinurs-rainbow-delimiters-settings.el ends here
