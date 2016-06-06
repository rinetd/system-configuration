;;; dotspacemacs-layers.el --- 

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)dotspacemacs-layers.el,v 0.0 2016/05/25 15:13:53 vinurs Exp $
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
;;   (require 'dotspacemacs-layers)


;;  "Configuration Layers declaration.
;;  You should not put any user code in this function besides modifying the variable
;;  values."



;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(setq-default
 ;; Base distribution to use. This is a layer contained in the directory
 ;; `+distribution'. For now available distributions are `spacemacs-base'
 ;; or `spacemacs'. (default 'spacemacs)
 dotspacemacs-distribution 'spacemacs
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
 ;; dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers")
 dotspacemacs-configuration-layer-path '()
 ;; List of configuration layers to load. If it is the symbol `all' instead
 ;; of a list then all discovered layers will be installed.
 dotspacemacs-configuration-layers
 '(
   ;; ----------------------------------------------------------------
   ;; Example of useful layers you may want to use right away.
   ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
   ;; <M-m f e R> (Emacs style) to install them.
   ;; ----------------------------------------------------------------
   better-defaults
   ranger
   osx
   ;;	gtags
   semantic
   emacs-lisp
   ;;(syntax-checking :variables syntax-checking-enable-by-default t)
   markdown
   org
   ;; (shell :variables
   ;;        shell-default-height 30
   ;;        shell-default-position 'bottom)
   ;; spell-checking
   themes-megapack
   (c-c++)
   (python)
   (colors)
   vinurs-basic
   ;; 开发环境的搭建
   vinurs-dev-env
   ;; 这个关于git的layer还是不错的
   git
   ;; 自动补全的layer
   (auto-completion
	:variables
	;; return键表示确认当前的选择
	auto-completion-return-key-behavior 'complete
	;; 自动补全中tab是一直循环着可选项
	auto-completion-tab-key-behavior 'cycle
	auto-completion-complete-with-key-sequence nil
	auto-completion-complete-with-key-sequence-delay 0.0
	auto-completion-private-snippets-directory nil
	;; 弹出式的自动补全
	auto-completion-enable-snippets-in-popup t
	;; 自动补全出的时候还带对应的帮助信息
	auto-completion-enable-help-tooltip t
	;; 私有snippets目录
	auto-completion-private-snippets-directory (concat (car dotspacemacs-configuration-layer-path)
													   "snippets/")
	
	auto-completion-enable-sort-by-usage t
	
	)
   ;; end 自动补全
   vinurs-themes
   )
 ;; List of additional packages that will be installed without being
 ;; wrapped in a layer. If you need some configuration for these
 ;; packages, then consider creating a layer. You can also put the
 ;; configuration in `dotspacemacs/user-config'.
 dotspacemacs-additional-packages '()
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '()
 ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
 ;; are declared in a layer which is not a member of
 ;; the list `dotspacemacs-configuration-layers'. (default t)
 dotspacemacs-delete-orphan-packages t)


(provide 'dotspacemacs-layers)

;;; dotspacemacs-layers.el ends here
