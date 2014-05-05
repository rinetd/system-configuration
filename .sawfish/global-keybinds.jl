;;; global-keybinds.jl --- 

;; Copyright 2012 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)global-keybinds.jl,v 0.0 2012/07/13 20:31:29 vinurs Exp $
;; Changed: <vinurs 07/14/2012 15:42:28>
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
;;   (require 'global-keybinds)




;;; Code:

(provide 'global-keybinds)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 重新加载sawfish
(bind-keys global-keymap "Super-r" 'restart)

(bind-keys root-window-keymap "button3-click1"
       '(popup-root-menu))

(bind-keys window-keymap "Super-m"
           'maximize-window-toggle)


;; M-tab来切换窗口，这个要放在最后，不知道跟上面哪个配置起了冲突
(bind-keys global-keymap "M-tab" 'cycle-windows)

;;; global-keybinds.jl ends here
