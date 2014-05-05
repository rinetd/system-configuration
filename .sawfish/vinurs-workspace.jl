;;; vinurs-workspace.jl --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-workspace.jl,v 0.0 2013/10/24 13:06:03 vinurs Exp $
;; Changed: <vinurs 10/24/2013 14:15:21>
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
;;   (require 'vinurs-workspace)




;;; Code:

(provide 'vinurs-workspace)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; for workspace

;; 预先创建4个workspace
(custom-set-typed-variable (quote workspace-names) (quote ("Main" "Internet" "Misc" "Amusement")) (quote (list string "Workspace names")))


;; 新创建4个workspace,这样一共4个workspace
;; (insert-workspace-after)
;; (insert-workspace-after)
;; (insert-workspace-after)


(screen-viewport)
(set-viewport 1 2)

(setq viewport-dimensions '(2 . 2))

;;; vinurs-workspace.jl ends here
