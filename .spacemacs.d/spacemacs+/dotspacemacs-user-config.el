;;; dotspacemacs-user-config.el ---

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)user-config.el,v 0.0 2016/05/17 07:28:04 vinurs Exp $
;; Changed: <vinurs 07/22/2016 22:52:54>
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
;;   (require 'dotspacemacs-user-config)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; "Configuration function for user code.
;; This function is called at the very end of Spacemacs initialization after
;; layers configuration.
;; This is the place where most of your configurations should be done. Unless it is
;; explicitly specified that a variable should be set before a package is loaded,
;; you should place you code here."
 


;; (setq powerline-default-separator 'arrow)

;; ; 在编辑模式下面c-h用来删除前面一个字符
;; (define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
;; ;; 在helm模式下面映射c-h为删除前一个字符
;; (with-eval-after-load 'helm
;;   (define-key helm-map (kbd "C-h") 'delete-backward-char)
;;   (define-key helm-map (kbd "C-k") 'kill-line)  
;;   )

;; ;; 一些emacs的快捷键我还是喜欢的
;; (define-key evil-motion-state-map (kbd "e") 'evil-end-of-line) 
;; (define-key evil-motion-state-map (kbd "C-e") 'evil-end-of-line) 

;; ;; 这里总觉得这样放乱糟糟的
;; (with-eval-after-load 'helm-swoop
;;   (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;;   (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
;;   (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
;;   (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
;;   )


;; (setq tab-width 4)

;; ;; 缩进提示线的配置，竖线
;; (setq indent-tabs-mode nil) 
;; (setq indent-guide-delay 0.1) 
;; ;; 这个跟自动补全下拉菜单配合得不好，所以暂时不启用
;; ;;(setq indent-guide-recursive t) 
;; (indent-guide-global-mode) 

;; ;; 美化显示符号（elisp），比如lambda会显示为λ
;; ;; (prettify-symbols-mode)
;; ;; (global-prettify-symbols-mode 1)
;; ;;  (spacemacs/helm-gtags-define-keys-for-mode 'c-mode)


;; 不显示结尾的空格
(setq-default spacemacs-show-trailing-whitespace nil) 


;;由菜单修改配置的东西将会保存在custom-file里
(setq custom-file "~/.spacemacs.d/custom.el")


;; 保存打开的文件以及文件中光标位置，重新打开emacs以后恢复
(desktop-save-mode)
(desktop-read)
(setq-default save-place t) 



(provide 'dotspacemacs-user-config)

;;; dotspacemacs-user-config.el ends here
