(push "/Users/vinurs/system-configuration/.spacemacs.d/layers/vinurs-basic/" load-path)
;; Prefixes
(setq spacemacs/key-binding-prefixes '(("o"   "user-defineds")
                                       ("oa"  "applications")
									   ))
(mapc (lambda (x) (apply #'spacemacs/declare-prefix x))
      spacemacs/key-binding-prefixes)

;;由菜单修改配置的东西将会保存在custom-file里
(setq custom-file "~/.spacemacs.d/custom.el")

;;自动换行
(add-hook 'org-mode-hook
    (lambda () (setq truncate-lines nil)))

;; 一行太长的时候自动换行
(setq truncate-lines t)
;; 不显示工具栏，碍眼
(tool-bar-mode -1)

;; Insert multiple spaces for indentation:
(setq indent-tabs-mode nil) 

;; Insert TAB for indentation:
;; 屏幕滚动更加平滑
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; two lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;;(require 'helm-swoop-settings)
;; 行号相关
(global-linum-mode t)
;; TODO 增加一些定制行号的字体的配置    
(custom-set-faces
 '(linum
   (   
    ;; for tty
    (((type tty) (class color))
     (:foreground "black"
                  :background "white"
                  :inherit)
     )   
    ;; for window
    (((type graphic) (class color))
     (:background "white"
                  :foreground "black"
                  ))
    ;; default
    (t (:foreground "blue"
                    :background "black"
                    )))
   ))

;;set my fullname and my email,they can be used when mailing
(setq user-full-name "haiyuan.zhang")
(setq user-mail-address "haiyuan.vinurs@gmail.com")

;; 保存session, use only one desktop
;; (desktop-save-mode)
;; (desktop-read)

;;(desktop-save-mode 1)
;;(setq desktop-path '("~/.spacemacs.d/"))
;;(setq desktop-dirname "~/.spacemacs.d/")
;;(setq desktop-base-file-name ".emacs-desktop")

;; 括号匹配相关
;; 高亮括号配对
(electric-pair-mode)

;; 高亮括号配对
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq hl-paren-colors
      '("blue" "purple" "cyan" "magenta" "green" "blue"
        "brown"  "salmon2" "wheat4"))


;; 对于用client打开的文件，也用C-x k关闭
(add-hook 'server-switch-hook
		  (lambda ()
			(when (current-local-map)
			  (use-local-map (copy-keymap (current-local-map))))
			(when server-buffer-clients
			  (local-set-key (kbd "C-x k") 'server-edit))))  
