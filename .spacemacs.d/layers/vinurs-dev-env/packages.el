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

	 ;; 统计编程时长
	 (vinurs-waketime :location local)

	 ;; helm-gtags
	 ;; ggtags

	 ;; doxymacs
	 (vinurs-doxymacs :location local)

	 ;; muttrc 
	 muttrc-mode

	 ;; autocomplete
	 (vinurs-autocomplete :location local)

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
	  (spacemacs|diminish graphviz-dot-mode " ⓓ" " d") 
      )
    )
  )

(defun vinurs-dev-env/init-muttrc-mode ()
  (use-package muttrc-mode
	:mode "\\.muttrc$"
	:defer t
	:init
	(progn
	  )
	:config
	(progn
	  )
	)
  )



(defun vinurs-dev-env/init-vinurs-doxymacs ()
  (use-package vinurs-doxymacs
	:demand t
	:config
	(progn
      (spacemacs|diminish doxymacs-mode " Ⓓ" " D") 
	  )
	)
  ) 


(defun vinurs-dev-env/init-vinurs-waketime ()
  (use-package vinurs-waketime
	:demand t
	:config
	(progn
      (spacemacs|diminish wakatime-mode " ⓦ" " w")
	  )
	)
  )

(defun vinurs-dev-env/init-vinurs-autocomplete ()
  (use-package vinurs-autocomplete
	:demand t
	:config
	(progn
      ;; (spacemacs|diminish wakatime-mode " ⓦ" " w")
	  )
	)
)
 



;;; packages.el ends here
