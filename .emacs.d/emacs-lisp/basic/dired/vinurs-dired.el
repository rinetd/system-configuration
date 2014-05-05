;;; vinurs-dired.el --- 

;; Copyright 2012 vinurs
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-dired.el,v 0.0 2012/03/09 20:51:57 vinurs Exp $
;; Changed: <vinurs 02/07/2013 14:22:33>
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
;;   (require 'vinurs-dired)




;;; Code:

(provide 'vinurs-dired)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; only one dired buffer for dired
(require 'dired-single)

;; 参好kid的网页修改了一些问题http://lifegoo.pluskid.org/wiki/EnhanceDired.html
(add-hook 'dired-load-hook
          (lambda ()
            (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
            (define-key dired-mode-map (kbd "<mouse-1>") 'dired-single-buffer-mouse)
            
            ;; 修正原来^会开启多个buffer的bug
            (define-key dired-mode-map (kbd "^")
              (lambda ()
                (interactive)
                (dired-single-buffer "..")))

            (setq dired-single-use-magic-buffer t)
            (setq dired-single-magic-buffer-name "*dired*")
            ))



(global-set-key (kbd "C-x 4 d")
                (lambda (directory)
                  (interactive "D")
                  (let ((win-list (window-list)))
                    (when (null (cdr win-list)) ; only one window
                      (split-window-vertically))
                    (other-window 1)
                    (dired-single-magic-buffer directory))))


(global-set-key (kbd "C-x d")
                'dired-single-magic-buffer)


;; 根据不同的后缀用不同的应用程序打开文件
(require 'vinurs-trivial)



;; 修改键绑定
(require 'vinurs-dired-keybinds)

;;; vinurs-dired.el ends here
