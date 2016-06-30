(push "~/.spacemacs.d/layers/vinurs-basic/" load-path)

;; Prefixes
;; 除了spacemac自定义的前缀键，我自己另外定义了oa表示我自己的应用程序
(setq spacemacs/key-binding-prefixes '(("o"   "user-defineds")
                                       ("oa"  "applications")
									   ))
(mapc (lambda (x) (apply #'spacemacs/declare-prefix x))
      spacemacs/key-binding-prefixes)


;; 个人信息的相关定义:邮件，全名
(require 'personality)

;; 编码设置:utf-8之类，所有的文件全部以utf8保存
(require 'vinurs-coding-settings)

;; emacs server相关
;; 对于用client打开的文件，也用C-x k关闭
(add-hook 'server-switch-hook
		  (lambda ()
			(when (current-local-map)
			  (use-local-map (copy-keymap (current-local-map))))
			(when server-buffer-clients
			  (local-set-key (kbd "C-x k") 'server-edit))))  

;; 设置info目录路径 
(add-to-list 'Info-default-directory-list "/usr/share/info")

;; 配置path环境变量
(setenv "PATH" (concat "/usr/local/bin/:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin/")))

;;;###autoload
(defun am-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.
HOOKS can be one list or just a hook."
  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (add-hook hooks function append local)))

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



;;由菜单修改配置的东西将会保存在custom-file里
(setq custom-file "~/.spacemacs.d/custom.el")

;; org-mode, 自动换行
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


;;show the time
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(setq display-time-format "%Y-%m-%d %A %H:%M")

;;时间 戳设置，设定文档上次保存到信息
;;只要在文档里有里Time-stamp:的设置，就会自动保存时间戳
;;启用time-stamp
(setq time-stamp-active t)
;;去掉time-stamp的警告
(setq time-stamp-warn-inactive t)
;;设置time-stamp的格式
(setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")
;;修改时间戳提示字符
(setq time-stamp-start "Changed:[  \t]+\\\\?[\"<]+")
(setq time-stamp-end: "\n")
;;前15行的时间戳提示符有效
(setq time-stamp-line-limit 15)
;;将修改时间戳的动作添加到保存文件动作里
(add-hook 'write-file-hooks 'time-stamp)

;; 高亮括号配对
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq hl-paren-colors
      '("blue" "purple" "cyan" "magenta" "green" "blue"
        "brown"  "salmon2" "wheat4"))


