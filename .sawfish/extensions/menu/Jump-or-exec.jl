;;; jump-or-exec.jl --- flexible application shortcut keys (v0.1)
;; -*- lisp-mode -*-

;; Copyright (C) 2002  Free Software Foundation, Inc.

;; Author: Damien Elmes <resolve@repose.cx>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; To use this file, put (require 'jump-or-exec) somewhere in your local config
;; files (like ~/.sawfishrc), and then define shortcuts using it like this one,
;; for example:

;; ;; load a multi gnome terminal,
;; ;; or switch to it if it's already running,
;; ;; and load a new tab if it's currently focused

;; (bind-keys global-keymap
;;     "W-o" `(jump-or-exec "MGT"         ; window title to jump to
;;         ,(lambda ()                    ; if the window doesn't exist
;;            (select-workspace 0)
;;            (system
;;             "multi-gnome-terminal --start-factory-server --use-factory &"))
;;         ,(lambda (wind)                ; if the window is focused already
;;            (display-window wind)
;;            (synthesize-event "C-F1" wind)
;;            (synthesize-event "n" wind))))


;;; Code:

;; this function is used a bit further in, in my local config. i use it to blur
;; the line between what's running and what needs to be started, so i can hit a
;; key to load something, or jump to it if it was already running. i love
;; sawfish.
(defun jump-or-exec (re prog #!optional onfocused)
  "jump to a window matched by re, or start program otherwise."
  (catch 'return
    (let ((wind (get-window-by-name-re re)))
      (if (functionp onfocused) ; check if already focused
          (let ((curwin (input-focus)))
            (if curwin
                (if (string-match re (window-name curwin))
                    (progn
                      (funcall onfocused wind)
                      (throw 'return))))))
      (if (windowp wind)
          (display-window wind)
        (if (functionp prog)
            (funcall prog)
          (system (concat prog "&")))))))

(provide 'jump-or-exec)
;;; jump-or-exec.jl ends here
