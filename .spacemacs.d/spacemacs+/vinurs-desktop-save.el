;;; vinurs-desktop-save.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-desktop-save.el,v 0.0 2016/07/30 11:09:54 vinurs Exp $
;; Changed: <vinurs 12/05/2016 22:36:45>
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
;;   (require 'vinurs-desktop-save)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(defvar emacs-version-short (format "%s_%s"
							  emacs-major-version emacs-minor-version)) 
;; 现在这个重启以后恢复大概需要30s，太慢了，以后要改
(use-package desktop
  :config
  (progn
    (defvar modi/no-desktop-read-at-startup nil
      "Set this variable to a non-nil value if you do not want to enable
`desktop-save-mode'.
This variable can be used to start emacs without reading the previously
saved desktop at startup:
> emacs --eval \"(setq modi/no-desktop-read-at-startup t)\"
")

    (setq desktop-base-file-name (concat "emacs_" emacs-version-short
                                         ".desktop"))
    (setq desktop-base-lock-name (concat "emacs_" emacs-version-short
                                         ".desktop.lock"))

    ;; Wed Jul 20 09:36:15 EDT 2016 - kmodi
    ;; Below problem seems to be fixed in emacs 25.x
    
    ;; https://github.com/purcell/emacs.d/blob/master/lisp/init-sessions.el
    ;; Save a bunch of variables to the desktop file.
    ;; For lists, specify the length of the maximal saved data too.
    (setq desktop-globals-to-save
	  (append '(
				 ;; (comint-input-ring . 50)
				 ;; desktop-missing-file-warning
				 ;; (dired-regexp-history . 20)
				 ;; (extended-command-history . 30)
				 ;; (face-name-history . 20)
				 ;; (file-name-history . 100)
				 ;; (ido-buffer-history . 100)
				 ;; (ido-last-directory-list . 100)
				 ;; (ido-work-directory-list . 100)
				 ;; (ido-work-file-list . 100)
				 ;; (magit-read-rev-history . 50)
				 ;; (minibuffer-history . 50)
				 ;; (org-refile-history . 50)
				 ;; (org-tags-history . 50)
				 ;; (query-replace-history . 60)
				 ;; (read-expression-history . 60)
				 ;; (regexp-history . 60)
				 ;; (regexp-search-ring . 20)
				 ;; register-alist
				 ;; (search-ring . 20)
				 ;; (shell-command-history . 50)
				 ;; tags-file-name
				 ;; tags-table-list
				 )))

    ;; Don't save .gpg files. Restoring those files in emacsclients causes
    ;; a problem as the password prompt appears before the frame is loaded.
    (setq desktop-files-not-to-save
          (concat "\\(^/[^/:]*:\\|(ftp)$\\)" ; original value
                  "\\|\\(\\.gpg$\\)"
                  "\\|\\(\\.plstore$\\)"
                  "\\|\\(\\.desktop$\\)"
                  ;; FIXME
                  ;; If backup files with names like "file.sv.20150619_1641.bkp"
                  ;; are saved to the desktop file, emacsclient crashes at launch
                  ;; Need to debug why that's the case. But for now, simply not
                  ;; saving the .bkp files to the desktop file is a workable
                  ;; solution -- Fri Jun 19 16:45:50 EDT 2015 - kmodi
                  "\\|\\(\\.bkp$\\)"
                  "\\|\\(\\TAGS$\\)"))

    ;; Don't save the eww buffers
    (let (;; http://thread.gmane.org/gmane.emacs.devel/202463/focus=202496
          (default (eval (car (get 'desktop-buffers-not-to-save 'standard-value))))
          (eww-buf-regexp "\\(^eww\\(<[0-9]+>\\)*$\\)"))
      (setq desktop-buffers-not-to-save (concat default
                                                "\\|" eww-buf-regexp)))

    (defun modi/restore-last-saved-desktop ()
      "Enable `desktop-save-mode' and restore the last saved desktop."
      (interactive)
      (desktop-save-mode 1)
      (desktop-read))

    (when (null modi/no-desktop-read-at-startup)
      (modi/restore-last-saved-desktop))

    )) 

;; (desktop-save-mode 1)
;; (savehist-mode 1)
;; (message (format-time-string"%a %H:%M:%S" (current-time))) 
;; (desktop-read)
;; ;;(desktop-load-default)

;; (setq desktop-buffers-not-to-save
;;   (concat "\\("
;; 	"^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
;; 	"\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
;; 	"\\)$"))
;; (add-to-list 'desktop-modes-not-to-save 'dired-mode)
;; (add-to-list 'desktop-modes-not-to-save 'Info-mode)
;; (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

(message "vinurs desktop-save load end %s"
  (format-time-string"%a %H:%M:%S" (current-time)))
;;(setq-default save-place t) 




(provide 'vinurs-desktop-save)

;;; vinurs-desktop-save.el ends here
