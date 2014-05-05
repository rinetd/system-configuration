;; 用来智能显示行号
(require 'linum+)

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
     (:background "black"
                  :foreground "white"
                  ))
    ;; default
    (t (:foreground "blue"
                    :background "black"
                    )))
   ))






