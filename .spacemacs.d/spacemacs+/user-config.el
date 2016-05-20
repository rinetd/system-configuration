;;; user-config.el ---

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)user-config.el,v 0.0 2016/05/17 07:28:04 vinurs Exp $
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
;;   (require 'user-config)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(setq powerline-default-separator 'arrow)
;; 不显示结尾的空格
(setq-default spacemacs-show-trailing-whitespace nil) 

; 在编辑模式下面c-h用来删除前面一个字符
(define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
;; 在helm模式下面映射c-h为删除前一个字符
(with-eval-after-load 'helm
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-map (kbd "C-k") 'kill-line)  
  )

;; 一些emacs的快捷键我还是喜欢的
(define-key evil-motion-state-map (kbd "e") 'end-of-line) 
(define-key evil-motion-state-map (kbd "C-e") 'end-of-line) 
 
;; 这里总觉得这样放乱糟糟的
(with-eval-after-load 'helm-swoop
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
  )



(setq tab-width 4)
;;(global-company-mode)
(global-auto-complete-mode)

;; 美化显示符号（elisp），比如lambda会显示为λ
(prettify-symbols-mode)
(global-prettify-symbols-mode 1)
;;  (spacemacs/helm-gtags-define-keys-for-mode 'c-mode)



(provide 'user-config)

;;; user-config.el ends here
