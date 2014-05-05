;;; my-functions.jl --- 

;; Copyright 2012 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)my-functions.jl,v 0.0 2012/03/28 11:56:49 vinurs Exp $
;; Changed: <vinurs 08/01/2012 17:19:38>
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
;;   (require 'my-functions)




;;; Code:

(provide 'my-functions)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 防止程序被挂起
;; copy from wangyin
(defun run-safely (cmd)
  "Run a command in a new process. And let it start in
background. Without stop the current WM execution"
  (interactive)
  (system 
   (if (string-match ".*&\\s*$" cmd)
       cmd
     (concat cmd " &"))))


;; copy from pluskid
(require 'rep.io.timers)
(defun kid-display-message (message &optional seconds)
  "display MESSAGE for SECONDS seconds and make the message disappeared.
The default display-message don't close the message window automatically"
  (interactive)
  (display-message message)
  (make-timer
   (lambda ()
     (display-message))                 ; close message window
   (or seconds 3)))

;; 有些程序只需要一个实例，例如ibus之类的
;; (defun only-one-instance)


;;; my-functions.jl ends here
