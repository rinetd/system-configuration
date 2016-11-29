(push "~/.spacemacs.d/layers/vinurs-dev-env/" load-path) 
;;(push "/Users/vinurs/system-configuration/.spacemacs.d/layers/vinurs-dev-env/" load-path)
;; 映射c-h为delete
;; (define-key helm-map (kbd "C-h") 'delete-backward-char)
;; (semantic-mode 1)
;; (spacemacs/toggle-semantic-stickyfunc-globally-on)
(setq-default tab-width 4)
(setq standard-indent 4)
(setq-default indent-tabs-mode t) 


;; for gluster dev
(require 'glusterfs-mode)

;; uncrustify-mode
(require 'uncrustify-mode) 

;; c-settings
(require 'c-settings) 

;; lisp-settings
(require 'lisp-settings) 

