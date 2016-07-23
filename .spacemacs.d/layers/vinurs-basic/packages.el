;;; packages.el --- vinurs-basic layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: vinurs <vinurs@vinurs-mac.local>
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
;; added to `vinurs-basic-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vinurs-basic/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vinurs-basic/pre-init-PACKAGE' and/or
;;   `vinurs-basic/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vinurs-basic-packages
  '(
    ;; 记录每个键的按键次数
    (keyfreq)

    ;; highlight tail性感的小尾巴标识最近修改
    (highlight-tail)

    ;; 新建文件的时候自动根据后缀补全一些文件的基本信息
    (template :location local)

    ;; 括号匹配
    (parent-mode)

    ;;    (general :location local)

    ) 
  "The list of Lisp packages required by the vinurs-basic layer.

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


(defun vinurs-basic/init-keyfreq ()
  (use-package keyfreq
    ;; 启动emacs的时候就加载该插件
    :demand t
    :config
    (progn
      (require 'keyfreq-settings)
      )
    )
  )

(defun vinurs-basic/init-highlight-tail ()
  (use-package highlight-tail
    :demand t
    :config
    (progn
      (message "enable lllll highlight tail")
      ;; 设置高亮的颜色
      (setq highlight-tail-colors
            '(("#c1e156" . 0)
              ("#b8ff07" . 25)
              ("#00c377" . 60))) 

      ;; const则渐变固定长度的修 改，而这个长度则是由highlight-tail-const-width来控制的
      (setq highlight-tail-steps 80
            highlight-tail-timer 0.1
            highlight-tail-const-width 30
            ) 

      (setq highlight-tail-posterior-type 'const) 
      ;; 全局开启highlight-tail mode
      ;; 这个暂时放在user-config里面，放在这里的时候启动会报错
      ;; (highlight-tail-mode) 


      )

    )
  )  


(defun vinurs-basic/init-parent-mode () 
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







(defun vinurs-basic/init-template () 
  (use-package template
    :init
    (progn
      )
    )
  (progn
    (setq template-default-directories 
          '("~/.spacemacs.d/layers/vinurs-basic/local/template/templates"
            ))
    (template-initialize)
    )
  )

;; (spacemacs|use-package-add-hook graphviz-dot-mode
;;   :pre-init
;;   ;; Code
;;   :post-init
;;   (progn
;;     (require 'graphviz-dot-mode-settings)
;;     )
;;   ;; Code
;;   :pre-config
;;   ;; Code
;;   :post-config
;;   ;; Code
;;   )

;; (defun vinurs-basic/init-graphviz-dot-mode ()
;;   (use-package graphviz-dot-mode
;;     :mode "\\.dot$"
;;     :defer t
;;     :init
;;     (progn
;;       ;; (require 'graphviz-dot-mode-settings)
;;       )
;;     )
;;   ) 


;;; packages.el ends here
