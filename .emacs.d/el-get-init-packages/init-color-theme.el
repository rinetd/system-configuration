;;(eval-after-load "color-theme"
 ;;'(progn
  ;;  (color-theme-initialize)))


;; TODO 在terminal下面跟xwindows下面是不一样的，这里要分别配置
;; (defun color-theme-vinurs-xwindow ()
;;   "Color theme by Fabien Penso, created 2002-05-02."
;;   (interactive)
;;   (color-theme-install
;;    '(color-theme-vinurs-xwindow
;;      (
;;       ;; 默认的颜色设置
;;       (background-color . "yellow")
;;       (background-mode . light)
;;       (border-color . "black")
;;       (cursor-color . "yellow")
;;       (foreground-color . "green")
;;       (mouse-color . "black")
;;       )
;;      ;; 注释的字体颜色设置,斜体
;;      (font-lock-comment-face ((t (:foreground "#cc0000" :italic t :width semi-condensed))))
     
;;      ;; 状态栏的颜色设置
;;      (mode-line ((t (:background "#0099cc" :foreground "black" :box (:line-width 1 :style none) :width condensed :family "neep"))))
;;      )
;;    )
;;   )


;; 终端下面的色彩主题配置
(defun color-theme-vinurs-terminal ()
  "Color theme by Fabien Penso, created 2002-05-02."
  (interactive)
  (color-theme-install
   '(color-theme-vinurs-terminal
     (
      ;; 默认的颜色设置
      (background-color . "white")
      (background-mode . light)
      (border-color . "black")
      (cursor-color . "yellow")
      (foreground-color . "green")
      (mouse-color . "black")
      )
     ;; 注释的字体颜色设置,斜体
     (font-lock-comment-face ((t (:foreground "#cc0000" :italic t :width semi-condensed))))
     
     ;; 状态栏的颜色设置
     (mode-line ((t (:background "#0099cc" :foreground "black" :box (:line-width 1 :style none) :width condensed :family "neep"))))
     )
   )
  )


;; (defun vinurs-terminal ()
;;   "for terminal test"
;;   (set-background-color "white")
;;   (message "hello"))



;(color-theme-tty-dark)
;; (color-theme-euphoria)
;; default is terminal color setting
(color-theme-vinurs-terminal)


(defun color-theme-vinurs-xwindow ()
  "Color theme by Fabien Penso, created 2002-05-02."
  (interactive)
  (message "hello wolrd")
  (progn
    (set-background-color "black")
    ))


;; set theme for frame when open with emacsclient -c
;;(add-hook 'after-make-frame-functions 'color-theme-vinurs-xwindow)


;; 设置默认字体
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))



