;;; packages.el --- vinurs-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: haiyuan.zhang <haiyuan.vinurs@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `vinurs-defaults-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vinurs-defaults/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vinurs-defaults/pre-init-PACKAGE' and/or
;;   `vinurs-defaults/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vinurs-defaults-packages
  '(
	 ;; pkg manager，有些软件还是需要用el-get之类的来进行安装的
	 ;; 先装个el-get，很多软件都在el-get里面
	 (vinurs-elget :location local)
	 ;; 可以用来安装单个文件
	 (auto-install :location local)

	 ;; 汉字跟英文，设置中英文对齐的
	 (chinese-fonts-setup)

	 ;; 记录每个键的按键次数
	 (keyfreq)

	 ;; highlight tail性感的小尾巴标识最近修改
	 ;; (highlight-tail)

	 ;; 括号匹配
	 (parent-mode)

	 ;; 新建文件的时候自动根据后缀补全一些文件的基本信息
	 (template :location local)

	 ;; 日历相关配置
	 ;; 农历
	 ;; (cal-china-x)
	 ;; (calfw)

	 ;; google翻译 
	 ;; 可惜Google在中国不能用, fuck GFW
	 ;; (google-translate)

	 )
  "The list of Lisp packages required by the vinurs-defaults layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun vinurs-defaults/init-vinurs-elget ()
  (use-package vinurs-elget
    ;; 启动emacs的时候就加载该插件
    :demand t
    :config
    (progn
      )
    )
  )

(defun vinurs-defaults/init-auto-install ()
  (use-package auto-install
    ;; 启动emacs的时候就加载该插件
    :demand t
    :config
    (progn
	  (setq auto-install-directory "~/.spacemacs.d/auto-install/") 
      )
    )
  )



(defun vinurs-defaults/init-keyfreq ()
  (use-package keyfreq
    ;; 启动emacs的时候就加载该插件
    :demand t
    :config
    (progn
      (require 'keyfreq-settings)
      )
    )
  )

(defun vinurs-defaults/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
    ;; 启动emacs的时候就加载该插件
    :demand t
    :config
    (progn
	   (require 'vinurs-chinese-fonts-setup) 
      )
    )
  )



(defun vinurs-defaults/init-google-translate()
  (use-package google-translate
    ;; 启动emacs的时候就加载该插件
    :demand t
    :config
    (progn
      )
    )
  )

;; (defun vinurs-defaults/init-highlight-tail ()
;;   (use-package highlight-tail
;;     :demand t
;;     :config
;;     (progn

;;       (spacemacs|diminish highlight-tail-mode " ℋ" " H") 
;;       ;; 设置高亮的颜色
;;       (setq highlight-tail-colors
;; 		'(("#c1e156" . 0)
;; 		   ("#b8ff07" . 25)
;; 		   ("#00c377" . 60))) 

;;       ;; const则渐变固定长度的修 改，而这个长度则是由highlight-tail-const-width来控制的
;;       (setq highlight-tail-steps 80
;; 		highlight-tail-timer 0.1
;; 		highlight-tail-const-width 30
;; 		) 

;;       (setq highlight-tail-posterior-type 'const) 

;; 	  (highlight-tail-make-faces
;; 		(highlight-tail-get-colors-fade-table-with-key 'default)) 

;;       ;; 全局开启highlight-tail mode
;; 	  ;; 如果发现启动的时候报这个错误:
;; 	  ;; Error running timer ‘highlight-tail-check-if-defaultbgcolor-changed’: (invalid-function highlight-tail-get-colors-fade-table-with-key)
;; 	  ;; 那是因为这个宏在源文件中定义得比较晚，不过不影响使用，如果有洁癖，那么可以打开源文件，把这个宏定义移动到开头，那么久可以去掉这个错误了
;;       (highlight-tail-mode) 

;;       )

;;     )
;;   )  


(defun vinurs-defaults/init-template () 
  (use-package template
    :init
    (progn
      )
    )
  (progn
    (setq template-default-directories 
	  '("~/.spacemacs.d/layers/vinurs-defaults/local/template/templates"
		 ))
    (template-initialize)
    )
  )



(defun vinurs-defaults/init-parent-mode () 
  (use-package parent-mode
    :demand t
    :config
    (progn
      ;; highlight entire expression
      (setq show-paren-style 'expression) 

      (setq show-paren-delay 0) 
      ;; highlight brackets
      ;; (setq show-paren-style 'parenthesis) 

      ;; highlight brackets if visible, else entire expression
      ;; 这种情况下只高亮括号，不高亮括号里面的内容
      ;; (setq show-paren-style 'mixed) 

      
      )
    )
  ) 


;; 比较好的emacs中国日历
(defun vinurs-defaults/init-cal-china-x()
  (use-package cal-china-x
    ;; 启动emacs的时候就加载该插件
    :demand t

    :config
    (progn
      )
    )
  )


;; 比较好的emacs日历
(defun vinurs-defaults/init-calfw()
  (use-package calfw
    ;; 启动emacs的时候就加载该插件
    :demand t

    :config
    (progn
	  (require 'vinurs-calendar)
      )
    )
  )



;;; packages.el ends here
