;;; test.jl --- 

;; Copyright 2012 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)test.jl,v 0.0 2012/08/02 21:02:01 vinurs Exp $
;; Changed: <vinurs 08/02/2012 21:06:48>
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'test)




;;; Code:

(provide 'test)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



(defvar *x* 100)
*x*
(defun fx () *x*)
(fx)

(let ((*x* 500)) (fx))
(fx)

(let ((a 100)
      (b 1000)
      c
      d
      )
  d
 )


(let ((y 200))
  (let ((fy (lambda () (format t "~a~%" y))))
    (funcall fy) ;; => 200
    (let ((y 500))
      (funcall fy) ;; => 200, the value of lexically bound y
      (setq y 500) ;; => y in the current environment is modified
      (funcall fy))

;;; test.jl ends here
