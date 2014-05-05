;;; init-hl-line+.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-hl-line+.el,v 0.0 2013/08/14 20:30:58 vinurs Exp $
;; Changed: <vinurs 08/20/2013 08:54:31>
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
;;   (require 'init-hl-line+)




;;; Code:

(provide 'init-hl-line+)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require 'hl-line+)



(global-hl-line-mode t)
;; (toggle-hl-line-when-idle 1) ;;仅在emacs空闲时高亮本行


(custom-set-faces
 '(hl-line
   (
    ;; for tty
    (((type tty) (class color))
     (:foreground "black"
                  :background "green"
                  :inherit)
     )
    ;; for window
    (((type graphic) (class color))
     (:background "red"
                  :foreground "black"
                  ))
    ;; default
    (t (:foreground "blue"
                    :background "black"
                    )))
   ))




;;; init-hl-line+.el ends here
