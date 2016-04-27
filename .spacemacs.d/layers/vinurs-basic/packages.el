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
    ;; 更够用鼠标更加平滑地移动
    smooth-scrolling
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


(defun vinurs-basic/init-smooth-scrolling ()
  (use-package smooth-scrolling
    :defer t
    :init
    (progn
      (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

      (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

      (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

      (setq scroll-step 2) ;; keyboard scroll one line at a time
      ;; evil-insert模式下面c-h该为向前删除
      (define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
      ;;(global-set-key [(control h)] 'delete-backward-char)

      ;;;设置标题栏显示文件的完整路径名
      (setq frame-title-format  
            '("vinurs@知行合一^-^--PATH:%S" (buffer-file-name "%f"  
                                                              (dired-directory dired-directory "%b"))))

      ;; 保存上次打开的文件的位置
      (save-place-mode 1)
      ;; 保存上次打开了哪些文档
      (desktop-save-mode 1)
      ;; 退出的时候保存上次的光标位置
      (setq-default save-place t)
      ;;设置 .emacs-places 文件的存储路径
      (setq save-place-file "~/.spacemacs.d/.emacs-places")

      ;; use only one desktop
      (desktop-save-mode 1)
      (setq desktop-save t)
      (setq desktop-load-locked-desktop t)
      (setq *desktop-dir* (list (expand-file-name "~/.spacemacs.d/desktop/")))
      (setq desktop-path *desktop-dir*)
      (setq desktop-dir *desktop-dir*)
      (setq desktop-base-file-name ".emacs.desktop")

      )))



;;; packages.el ends here
