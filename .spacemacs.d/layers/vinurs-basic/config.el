;; add to load-path first
(push "~/.spacemacs.d/layers/vinurs-basic/" load-path)


;; ;; 个人信息的相关定义:邮件，全名
;; (require 'personality)


;; emacs server相关
;; 对于用client打开的文件，也用C-x k关闭
(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (when server-buffer-clients
              (local-set-key (kbd "C-x k") 'server-edit))))  

;; ;; 设置info目录路径 
;; (add-to-list 'Info-default-directory-list "/usr/share/info")

;; ;;;###autoload
;; (defun am-add-hooks (hooks function &optional append local)
;;   "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.
;; HOOKS can be one list or just a hook."
;;   (if (listp hooks)
;;       (mapc
;;        `(lambda (hook)
;;           (add-hook hook ',function append local))
;;        hooks)
;;     (add-hook hooks function append local)))

;; 当major-mode是image-mode的时候关于高亮当前行以及关闭行号显示
;; (am-add-hooks
;;  `(find-file-hook help-mode-hook Man-mode-hook log-view-mode-hook chart-mode-hook
;;                   compilation-mode-hook gdb-mode-hook lisp-interaction-mode-hook
;;                   browse-kill-ring-mode-hook completion-list-mode-hook hs-hide-hook
;;                   inferior-ruby-mode-hook custom-mode-hook Info-mode-hook svn-log-edit-mode-hook
;;                   package-menu-mode-hook dired-mode-hook apropos-mode-hook svn-log-view-mode-hook
;;                   diff-mode-hook emacs-lisp-mode-hook ibuffer-mode-hook html-mode-hook
;;                   w3m-mode-hook data-debug-hook debugger-mode-hook text-mode-hook color-theme-mode-hook
;;                   semantic-symref-results-mode-hook sh-mode-hook groovy-mode-hook)
;;  (lambda()
;;    (if (not (memq major-mode '(image-mode)))
;; 	   (progn
;; 		 (message "hello,this is image-mode")
;; 		 (hl-line-mode 0)
;; 		 (linum-mode -1) 
;; 		 )
;; 	 ))) 




;; Insert multiple spaces for indentation:
(setq indent-tabs-mode nil) 

;; Insert TAB for indentation:
;;(require 'helm-swoop-settings)
;; 行号相关
(global-linum-mode t)
;; TODO 增加一些定制行号的字体的配置    
;; (custom-set-faces
;;  '(linum
;;    (   
;;     ;; for tty
;;     (((type tty) (class color))
;;      (:foreground "black"
;;                   :background "white"
;;                   :inherit)
;;      )   
;;     ;; for window
;;     (((type graphic) (class color))
;;      (:background "default"
;;                   :foreground "green"
;;                   ))
;;     ;; default
;;     (t (:foreground "blue"
;;                     :background "black"
;;                     )))
;;    ))

;;set my fullname and my email,they can be used when mailing
(setq user-full-name "haiyuan.zhang")
(setq user-mail-address "haiyuan.vinurs@gmail.com")


;; 括号匹配相关
;; 高亮括号配对
(electric-pair-mode)



;; 高亮括号配对
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq hl-paren-colors
      '("blue" "purple" "cyan" "magenta" "green" "blue"
        "brown"  "salmon2" "wheat4"))


