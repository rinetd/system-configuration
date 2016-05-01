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
;;    (general :location local)
    (parent-mode)
    ;; 保存上次打开的文件
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

(defun vinurs-basic/init-parent-mode () 
  (use-package parent-mode
    :defer t)
  ;; TODO: 增加加粗当前括号的功能
  ;; 不过目前的这种效果也有用
  (show-paren-mode 1)
  (setq show-paren-delay 0)
  ;; (setq show-paren-style 'parenthesis) ; highlight brackets

  (setq show-paren-style 'expression) ; highlight entire expression

  ;; (setq show-paren-style 'mixed) ; highlight brackets if visible, else entire expression

  (require 'paren)
  ;; (set-face-background 'show-paren-match (face-background 'default))
  ;; (set-face-foreground 'show-paren-match "#def")
  ;; 匹配的地方字体加粗，这个比较好，一直是我想要的
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)


  )




;;; packages.el ends here
