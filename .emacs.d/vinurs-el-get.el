;;; vinurs-el-get.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)vinurs-dot-emacs.el 0.0 2011/03/22 11:05:27 victor Exp $
;; Changed: <vinurs 02/26/2016 19:42:50>
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

		;; ;;;;;;;;;;;;;;;;;;;;;;
		;; 统计一下每个常用的按键频率
		keyfreq

		;; basic
		highlight-parentheses           ; 高亮对应的括号

		;; which-key是不是觉得有时候一个按键下去突然忘记了下面该按什么？
		;; 有了这个插件以后停顿一秒就可以提示你接下来一共有哪些按键可用
		which-key

		;; helm相关
		helm
		
		;; 列出所有的键绑定
		helm-descbinds


		;; search相关
		;; 很好的搜索的插件
		helm-swoop
		;; avy
		;; ace-isearch

		
		;; powerline
		;; mode-line更加好看，比较喜欢这个
		powerline
		;; 	;; emacs-powerline
		
		;; 更加平滑一点的滑动
	   	smooth-scroll
	   	smooth-scrolling
		
		;; hightlight symbol
		highlight-symbol

		linum+                          ;;显示行号
		;; 高亮当前行
		hl-line+                        ;

		hexrgb                          ;palette依赖这个
		palette                         ;颜色选择插件，很强大
		ascii

		;; 	;; 版本控制
		;; 	;; git
	   	magit
		;; 	;; 版本控制end

		
		;;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;   ;; c语言开发相关配置
		;;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; 项目管理
		;; 这个会自动安装projectile
		projectile
		helm-projectile

		
		;; develope
		;; 标准的注释
		xml-parse
		doxymacs

		graphviz-dot-mode
		;;   ;; dired不过这个一般默认就集成在emacs里了，我这里增加的是一些有用的扩展


		
		;; ;; auto-complete
		;; ;; 所有的自动补全相关的配置
		;; auto-complete
		;; auto-complete+
		;; ;;   ;; 用clang来给c自动补全
		;; auto-complete-clang
		;; auto-complete-clang-extension


		;;   ;; global gtags
		;; 	;; ggtags一直在更新维护，xgtags已经不更新了
		ggtags
		;; 这个会在buffer的最上面一行现实函数名字
		;; semantic-stickyfunc-enhance
		;; 这个目前看起来用的感觉并不好
		;; helm-gtags

		;; 自动补全
		;; cedet就用到里面的semantic
		;; cedet
		;; company mode
		company-c-headers
		company-mode
		

		;; python

		;;   ;; mew
	   	emacs-w3m

		;; markdown,用github写博客
		;; markdown-mode

		;; 括号补全
		;; parenthesis

		
		;; org mode
		;; org-mode
		;; common lisp
		;; slime

		;; 缩进提示线
		;; 这个目前用得不爽，暂时先不用
		;; highlight-indentation

		;; flycheck
		;; flycheck
        
		;; 代码折叠相关
		;; hs-mode
		hideif
		hide-region  ;; 这个放在最后面吧，所有的配置都在这个init里面

		;; 当窗口分割变多的时候，快速切换窗口
	   	ace-window
		;;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        )
	  
      )


;; 每次启动el-get的时候检测el-get是否已经安装，如果没有安装就自动安装
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;; 用户自己定义的一些插件地址
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;
;;(el-get-cleanup my-el-get-packages)
(el-get 'sync my-el-get-packages)

