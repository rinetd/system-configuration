(push "~/.spacemacs.d/layers/vinurs-dev-env/" load-path) 


;; TODO: 这个好奇怪，后面要删掉
(setq default-tab-width 4) 
(setq-default tab-width 4)
(setq standard-indent 4)
;; TODO: 下面这个后面也要删掉
;; (setq-default indent-tabs-mode t) 


;; for gluster dev
(require 'glusterfs-mode)


;; c-settings
(with-eval-after-load 'cc-mode
  ;; c/c++ common settings
  (require 'c-c++-common-settings) 

  ;; c-settings
  (require 'c-settings) 

  ;; c++-settings
  (require 'c++-settings) 
  ) 

;; lisp-settings
(with-eval-after-load 'lisp-mode
  (require 'lisp-settings) 
)

;; emacs-lisp-settings
(with-eval-after-load 'emacs-lisp-mode
  (require 'emacs-lisp-settings) 
  )

