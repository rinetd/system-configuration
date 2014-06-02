;;; vinurs-el-get.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)vinurs-dot-emacs.el 0.0 2011/03/22 11:05:27 victor Exp $
;; Changed: <vinurs 05/30/2014 03:23:10>
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
;;   (require 'vinurs-el-get)


;; 设置el-get的init-packages路径
(setq el-get-user-package-directory "~/.emacs.d/el-get-init-packages")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")




;; 我自己需要的一些软件包
(setq my-el-get-packages
      '(
        ;; local sources
        
        ;; base
        highlight-parentheses           ; 高亮对应的标点

        ;; hightlight symbol
        highlight-symbol
        
        linum+                          ;;显示行号
        hl-line+                        ;
        yasnippet                       ;
        hexrgb                          ;palette依赖这个
        palette                         ;颜色选择插件，很强大
        ascii
        ;; c

        ;; 标准的注释
        xml-parse
        doxymacs

	;; dired不过这个一般默认就集成在emacs里了，我这里增加的是一些有用的扩展


        ;; auto-complete
        ;; 所有的自动补全相关的配置
        auto-complete
        auto-complete+
        ;; cedet
        ;; ecb
        
        ;; markdown,用github写博客
        markdown-mode

	;; 括号补全
	;; parenthesis

                
        ;; global gtags
        ;; ggtags
        xgtags                          ;for global
        xgtags-extension                ;for global

        ;; org mode
        org-mode
        ;; common lisp
        slime
	
	;; flymake
	flymake
	
	;; 代码折叠相关
	;; hs-mode
	hideif
	hide-region  ;; 这个放在最后面吧，所有的配置都在这个init里面

        ;;color-theme                     ;;主题
        )
      )



;; 每次启动el-get的时候检测el-get是否已经安装，如果没有安装就自动安装
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")


;;(el-get-cleanup my-el-get-packages)
(el-get 'sync my-el-get-packages)

