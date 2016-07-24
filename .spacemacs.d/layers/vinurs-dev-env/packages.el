;;; packages.el --- vinurs-dev-env layer packages file for Spacemacs.
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
;; added to `vinurs-dev-env-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vinurs-dev-env/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vinurs-dev-env/pre-init-PACKAGE' and/or
;;   `vinurs-dev-env/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vinurs-dev-env-packages
  '(
    ;; dot画图语言
    (graphviz-dot-mode)


	 ;; helm-gtags
	 ;; ggtags


	 ;; git相关
	 ;; magit

	 ;; muttrc 
	 muttrc-mode
	 )
  "The list of Lisp packages required by the vinurs-dev-env layer.

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


(defun vinurs-dev-env/init-graphviz-dot-mode ()
  (use-package graphviz-dot-mode
    :mode "\\.dot$"
    :defer t
    :config
    (progn
      (require 'graphviz-dot-mode-settings)
      )
    )
  )

(defun vinurs-dev-env/init-muttrc-mode ()
  (use-package muttrc-mode
	:mode "\\.muttrc$"
	:defer t
	:init
	(progn
	  ))
  )


(defun vinurs-dev-env/init-ggtags ()
  (use-package ggtags
    :defer t))

(defun vinurs-dev-env/init-helm-gtags ()
  (use-package helm-gtags
    :defer t
    :init
    (progn
      (setq helm-gtags-ignore-case t
		helm-gtags-auto-update t
		helm-gtags-use-input-at-cursor t
		helm-gtags-pulse-at-cursor t)
      ;; modes that do not have a layer, define here
      (spacemacs/helm-gtags-define-keys-for-mode 'tcl-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'c-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'java-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'vhdl-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'shell-script-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'awk-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'asm-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'dired-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'compilation-mode)
      (spacemacs/helm-gtags-define-keys-for-mode 'shell-mode)

      (spacemacs/ggtags-enable-eldoc 'tcl-mode)
      (spacemacs/ggtags-enable-eldoc 'java-mode)
      (spacemacs/ggtags-enable-eldoc 'vhdl-mode))
    :config
    (progn
      ;; if anyone uses helm-gtags, they would want to use these key bindings
      (define-key helm-gtags-mode-map (kbd "M-.") 'ggtags-find-tag-dwim)
      (define-key helm-gtags-mode-map (kbd "C-x 4 .") 'helm-gtags-find-tag-other-window)
      (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
      (define-key helm-gtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack))))

;; (defun vinurs-dev-env/init-magit ()
;;   (use-package magit
;;     :defer t
;;     :init
;; 	(progn
;; 	  (require 'git-settings))
;; 	)
;;   )



;;; packages.el ends here
