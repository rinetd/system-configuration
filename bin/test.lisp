#!/usr/bin/sbcl --script

;; 调用外部程序
(sb-ext:run-program "ls" nil 
             :search '$PATH
             :output *standard-output*)


;; (read)
;; (read-line)

