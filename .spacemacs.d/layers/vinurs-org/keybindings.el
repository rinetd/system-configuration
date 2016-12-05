;;; keybindings.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)keybindings.el,v 0.0 2016/08/31 09:47:44 vinurs Exp $
;; Changed: <vinurs 12/04/2016 14:40:22>
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
;;   (require 'keybindings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



;; ;; 导成pdf，后面这个需要集中修改一下org的快捷键
;; (spacemacs/set-leader-keys-for-major-mode
;;   'org-mode
;;   "ome" 'org-pandoc-export-to-latex-pdf) 

;; (spacemacs/set-leader-keys-for-major-mode
;;   'org-mode
;;   "omf" ') 

;; 将space+o+m定义成major-mode
(spacemacs/set-leader-keys "aod" 'org-pandoc-export-to-latex-pdf) 

;; (setq vinurs-spacemacs/key-binding-prefixes '(
;; 											   ("mo"   "user-defineds")
;; 											   ("oa"  "applications")
;; 											   )) 

(add-hook 'org-mode-hook '(lambda ()
                            ;; keybinding for editing source code blocks
							(spacemacs/set-leader-keys-for-major-mode 'org-mode
							  "i e" 'org-edit-src-code) 
							;; insert footnote
							(spacemacs/set-leader-keys-for-major-mode 'org-mode
							  "i f" 'org-footnote-action) 
							;; keybinding for inserting code blocks
							(spacemacs/set-leader-keys-for-major-mode 'org-mode
							  "i s" 'org-insert-src-block) 
							;; insert html readmore
							(spacemacs/set-leader-keys-for-major-mode 'org-mode
							  "i r" 'org-insert-html-readmore) 
							)) 

(provide 'keybindings)

;;; keybindings.el ends here
