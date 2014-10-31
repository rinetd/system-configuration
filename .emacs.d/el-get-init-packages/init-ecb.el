;;; init-ecb.el --- 

;; Copyright 2014 vinurs
;;
;; Author: vinurs@localhost.localdomain
;; Version: $Id: @(#)ini-ecb.el,v 0.0 2014/05/16 15:14:15 vinurs Exp $
;; Changed: <vinurs 10/31/2014 11:50:25>
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.




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
;;   (require 'ini-ecb)




;;; Code:

(provide 'ini-ecb)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; cedet

(load-file "~/.emacs.d/el-get/cedet/lisp/cedet/cedet.el")
(semantic-mode 1)





;; -------------------------------------------------------
;; |             |                         |             |
;; | Directories |                         |  taglist    |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |-------------|          Edit           |             |
;; |             |                         |             |
;; | Sources     |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; |             |                         |             |
;; -------------------------------------------------------
;; |                                                     |
;; |                   Compilation                       |
;; |                                                     |
;; -------------------------------------------------------

(require 'ecb)



;; (defecb-window-dedicator-to-ecb-buffer
;;     ecb-set-taglist-buffer
;;     "*xgtags*" nil "taglist" 
;;     (switch-to-buffer "*xgtags*")
;;     (set-window-dedicated-p (selected-window) nil))

;; (defecb-window-dedicator-to-ecb-buffer ecb-set-taglist-buffer "taglist"
;;   (switch-to-buffer (get-buffer-create "*xgtags*")))

(ecb-layout-define "vinurs-layout" left-right
  nil
  ;; here we have an edit-window and left and right two windows each
  ;; with width `ecb-windows-width'. Dependent to the value of
  ;; `ecb-compile-window-height' we have also a compile-window at the
  ;; bottom.

  (ecb-set-methods-buffer)
  (select-window (next-window))
  (select-window (next-window))
  (ecb-set-sources-buffer)  

  ;; (select-window (previous-window (previous-window (selected-window) 0) 0)))
  ;; select the edit-window.
  (select-window (previous-window))
)



;; 默认用我自己定义的layout
(setq ecb-layout-name "vinurs-layout")
(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes
   (quote (("vinurs-layout"
            (ecb-methods-buffer-name 0.20 . 0.98) ;宽百分比 高百分比
            (ecb-sources-buffer-name 0.20 . 0.98)))))
 '(ecb-options-version "2.40")
 '(ecb-auto-update-methods-after-save t)
 )

;; 跟switch-window冲突，这里加个hook
(add-hook 'ecb-activate-hook (global-set-key (kbd "C-o") 'switch-window))



;;ecb启动的时候会弹出一个提示窗口,如果不想看到它，可以在emacs配置文件(~/.emacs)里加这一句:
(setq ecb-tip-of-the-day nil)
(ecb-activate)






;;; ini-ecb.el ends here
