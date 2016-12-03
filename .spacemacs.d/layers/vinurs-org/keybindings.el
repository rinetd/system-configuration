;;; keybindings.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)keybindings.el,v 0.0 2016/08/31 09:47:44 vinurs Exp $
;; Changed: <vinurs 12/03/2016 23:15:46>
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


;; 导成pdf，后面这个需要集中修改一下org的快捷键
(spacemacs/set-leader-keys "aod" 'org-pandoc-export-to-latex-pdf) 

(spacemacs/set-leader-keys "mof" 'org-footnote-action) 
(org-footnote-action &optional SPECIAL)

(provide 'keybindings)

;;; keybindings.el ends here
