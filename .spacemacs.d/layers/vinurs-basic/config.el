(push "/Users/vinurs/system-configuration/.spacemacs.d/layers/vinurs-basic/" load-path)
;; 一行太长的时候自动换行
(setq truncate-lines t)
;; 不显示工具栏，碍眼
(tool-bar-mode -1)

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


;; 括号匹配相关
;; 高亮括号配对
(electric-pair-mode)

;; 高亮括号配对
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq hl-paren-colors
      '("blue" "purple" "cyan" "magenta" "green" "blue"
        "brown"  "salmon2" "wheat4"))


