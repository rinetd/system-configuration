;;; vinurs-misc.jl --- 

;; Copyright 2012 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)vinurs-misc.jl,v 0.0 2012/03/30 16:53:26 vinurs Exp $
;; Changed: <vinurs 07/14/2012 08:11:42>
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
;;   (require 'vinurs-misc)




;;; Code:

(provide 'vinurs-misc)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; (bind-keys global-keymap "W-j" '(cp-move-left (input-focus)))
;; (bind-keys global-keymap "W-l" '(cp-move-right (input-focus)))
;; (bind-keys global-keymap "W-i" '(cp-move-top (input-focus)))
;; (bind-keys global-keymap "W-," '(cp-move-bottom (input-focus)))
;; (bind-keys global-keymap "W-u" '(cp-move-top-left (input-focus)))
;; (bind-keys global-keymap "W-o" '(cp-move-top-right (input-focus)))
;; (bind-keys global-keymap "W-m" '(cp-move-bottom-left (input-focus)))
;; (bind-keys global-keymap "W-." '(cp-move-bottom-right (input-focus)))
;; (bind-keys global-keymap "W-n" '(cp-maximize (input-focus)))
;; (bind-keys global-keymap "W-k" '(cp-move-center (input-focus)))
;; (bind-keys global-keymap "W-Space" '(cp-move-origin-geometry (input-focus)))

;; (set-window-type (get-window-by-name-re "rxvt") 'unframed)
(require 'sawfish.wm.ext.match-window)
(add-window-matcher '(( WM_CLASS . "rep" ))
                    '(( keymap-trans . (( "C-n" "Down")))))






;;; vinurs-misc.jl ends here
