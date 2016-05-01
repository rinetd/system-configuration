;; 一行太长的时候自动换行
(setq truncate-lines t)
;; 不显示工具栏，碍眼
(tool-bar-mode -1)

;; 映射c-h为delete
;;(define-key helm-map (kbd "C-h") 'delete-backward-char)
;; 显示行号
;;(global-linum-mode)
(global-linum-mode t)
;; TODO 增加一些定制行号的字体的配置    
;; 不过这个好象有点问题，当一行过长的时候分行显示的时候下面一行就没有颜色了
;; 得先想好了我到底需要什么样的显示
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

;;括号 

(setq hl-paren-colors '("blue" "purple" "cyan" "magenta" "green" "blue"
                        "brown"  "salmon2" "wheat4"))

