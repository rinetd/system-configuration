;;; dotspacemacs-user-config.el ---

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)user-config.el,v 0.0 2016/05/17 07:28:04 vinurs Exp $
;; Changed: <vinurs 11/17/2016 17:49:28>
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

;; 对spacemacs自身的键绑定作的一些修改
(require 'dotspacemacs-keybinds)

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

;; space s s
;; Use search query at the cursor  (default)
(setq helm-swoop-pre-input-function
  (lambda () (thing-at-point 'symbol))) 


;; 原来打开文件的时候不能用template，这里重新定义一下打开文件的函数


;; 不显示结尾的空格
(setq-default spacemacs-show-trailing-whitespace nil) 


;; 保存打开的文件以及文件中光标位置，重新打开emacs以后恢复
(require 'vinurs-desktop-save) 

;; Prefixes
;; 除了spacemac自定义的前缀键，我自己另外定义了oa表示我自己的应用程序
(setq vinurs-spacemacs/key-binding-prefixes '(
											   ("o"   "user-defineds")
											   ("oa"  "applications")
											   )) 
(mapc (lambda (x) (apply #'spacemacs/declare-prefix x))
  vinurs-spacemacs/key-binding-prefixes) 


;; 全局开启自动缩进
(aggressive-indent-global-mode t) 


(message (format-time-string"%a %H:%M:%S" (current-time))) 
;;
(message "load user config end")


(provide 'dotspacemacs-user-config)

;;; dotspacemacs-user-config.el ends here
