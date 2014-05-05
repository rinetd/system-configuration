;; wmaker.jl -- simple dock shaped after WindowMaker
;; $Id$

;; Copyright (C) 2000 Walter C. Pelissero <walter@pelissero.org>

;; This file is not yet part of sawmill.

;; This module is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 2, or (at your
;; option) any later version.

;; This module is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with sawmill; see the file COPYING.  If not, write to the
;; Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;; Usage:
;;	(require 'wmaker)
;;	(system "wmapplication &")
;;	 ...
;; If you experience dockable applications still floating around on the
;; workspace, ignoring our placement, then it might be worth trying
;; this after all the systems:
;;	(sleep-for 2)
;;	(wmaker-refresh-dock)


;; These should belong to workspace.jl or such
(defconst WithdrawnState 0)
(defconst WM_HINTS_INPUT 1)
(defconst WM_HINTS_STATE 2)
(defconst WM_HINTS_ICON_PIXMAP 4)
(defconst WM_HINTS_ICON_WINDOW 8)
(defconst WM_HINTS_ICON_POSITION 16)
(defconst WM_HINTS_ICON_MASK 32)
(defconst WM_HINTS_WINDOW_GROUP 64)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar wmaker-dock '()
  "List of windows currently in the dock.
Don't edit by hand!")

(defvar wmaker-dockables-by-class '("wmmixer" "WMMail" "wmmount" "wmpinboard")
  "List of window classes belonging to dockable applications that don't
show themselves as such (no withdrawn state set) .")

(defun wmaker-is-window-withdrawn (w)
  "Return true if w is withdrawn."
  (let ((hints (get-x-property w 'WM_HINTS)))
    (if hints
	(let* ((v (nth 2 hints))
	       (bits (aref v 0))
	       (state (aref v 2)))
	  ;; check if the state hint is set and it's set to withdrawn
	  (and (not (zerop (logand bits WM_HINTS_STATE)))
	       (= state WithdrawnState))))))

(defun wmaker-honour-client-hints (w)
  "Check if w is a dockable window.  In that case add it to the dock."
  (let ((class (get-x-property w 'WM_CLASS)))
    (when (or
	   (wmaker-is-window-withdrawn w)
	   (and class
		(member-if (function
			    (lambda (s)
			      (string-match s (nth 2 class))))
			   wmaker-dockables-by-class)))
      (wmaker-add-to-dock w))))

(defun wmaker-add-to-dock (w)
  "Add w to wmaker-dock after setting its properties accordingly."
  ;; (window-put w 'focus-click-through t)
  (window-put w 'ignored t)
  (window-put w 'avoid t)
  (window-put w 'sticky t)
  (window-put w 'depth -1)
  (window-put w 'sticky-viewport t)
  (window-put w 'never-focus t)
  (window-put w 'frame-type 'none)
  (window-put w 'client-set-position nil)
  (window-put w 'fixed-position t)
  (window-put w 'task-list-skip t)
  (setq wmaker-dock (cons w wmaker-dock))
  (wmaker-place-new-dockapp w))

(defun wmaker-remove-from-dock (w)
  "Remove w from wmaker-dock."
  (setq wmaker-dock (delete w wmaker-dock)))

(defun wmaker-place-new-dockapp (w)
  "Place w phisically in the dock."
  (wmaker-refresh-dock))

(defun wmaker-refresh-dock ()
  "Reposition all the windows listed in wmaker-dock.
This function is called whenever a change in the dock is detected."
  (let ((icons-per-column (quotient (screen-height) 64)))
    (let loop ((i (- (length wmaker-dock) 1))
	       (l wmaker-dock))
	 (when (not (null l))
	   (let ((w (car l))
		 (x (- (screen-width)
		       (* (+ (quotient i icons-per-column) 1) 64)))
		 (y (* (% i icons-per-column) 64)))
	     (window-put w 'position x y)
	     (move-window-to w x y)
	     (loop (- i 1) (cdr l)))))))

(defun wmaker-on-exit ()
  "Function called when sawfish ends.  This is mainly to make sure all
the dock applications are killed before restarting."
  (mapcar delete-window wmaker-dock))

(add-hook 'before-exit-hook (function wmaker-on-exit))
(add-hook 'before-add-window-hook (function wmaker-honour-client-hints))
;; (add-hook 'place-window-hook (function wmaker-place-new-dockapp) t)
(add-hook 'destroy-notify-hook (function wmaker-remove-from-dock))

(provide 'wmaker)
