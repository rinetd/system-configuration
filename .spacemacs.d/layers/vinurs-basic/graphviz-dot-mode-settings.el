;;; graphviz-dot-mode-settings.el --- 

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)graphviz-dot-mode-settings.el,v 0.0 2016/05/11 19:09:02 vinurs Exp $
;; Changed: <victor 02/20/2011 11:29:30>
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
;;   (require 'graphviz-dot-mode-settings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(spacemacs/declare-prefix "oad" "graphviz")
(setq vinurs/graphviz-key-binding-prefixes "oad")


(defun new-graphviz-dot-preview ()
  "Shows an example of the current dot file in an emacs buffer.
This assumes that we are running GNU Emacs or XEmacs under a windowing system.
See `image-file-name-extensions' for customizing the files that can be
loaded in GNU Emacs, and `image-formats-alist' for XEmacs."
  (interactive)
  ;; unsafe to compile ourself, ask it to the user
  (if (buffer-modified-p)
      (message "Buffer needs to be compiled.")
    (if (string-match "XEmacs" emacs-version)
        ;; things are easier in XEmacs...
        (find-file-other-window (concat (file-name-sans-extension
                                         buffer-file-name)
                                        "." graphviz-dot-preview-extension))
      ;; run through all the extensions for images
      (let ((l image-file-name-extensions))
        (while
            (let ((f (concat (file-name-sans-extension (buffer-file-name))
                             "."
                             (car l))))
              ;; see if a file matches, might be best also to check
              ;; if file is up to date TODO:PP
              (if (file-exists-p f)
                  (progn (auto-image-file-mode 1)
                         ;; OK, this is ugly, I would need to
                         ;; know how I can reload a file in an existing buffer
                         (if (get-buffer "*preview*")
							 (let ((last-window	(get-buffer-window "*preview*")))
							   (kill-buffer "*preview*") 
							   (set-buffer (find-file-noselect f))
							   (rename-buffer "*preview*")
							   (if (null last-window)
								   (display-buffer (get-buffer "*preview*"))
								 (progn
								   (set-window-buffer last-window "*preview*")
								   last-window
								   ))
							   )
						   ;; else
						   (progn
							 (set-buffer (find-file-noselect f))
							 (rename-buffer "*preview*")
							 (display-buffer (get-buffer "*preview*")))) 
                         ;; stop iterating
                         '())
                ;; will stop iterating when l is nil
                (setq l (cdr l)))))
		;; each extension tested and nothing found, let user know
		(when (eq l '())
		  (message "No image found.")))))) 


;; ;; all buffers, try to reuse windows across all frames
;; (add-to-list 'display-buffer-alist
;; 			 '("*preview11*". (display-buffer-reuse-window .
;; 												  ((reusable-frames . t))))) 
;; (get-buffer-window "*preview11*") 

(defun new1-graphviz-dot-preview ()
  "Shows an example of the current dot file in an emacs buffer.
This assumes that we are running GNU Emacs or XEmacs under a windowing system.
See `image-file-name-extensions' for customizing the files that can be
loaded in GNU Emacs, and `image-formats-alist' for XEmacs."
  (interactive)
  ;; unsafe to compile ourself, ask it to the user
  (if (buffer-modified-p)
      (message "Buffer needs to be compiled.")
    (if (string-match "XEmacs" emacs-version)
        ;; things are easier in XEmacs...
        (find-file-other-window (concat (file-name-sans-extension
                                         buffer-file-name)
                                        "." graphviz-dot-preview-extension))
      ;; run through all the extensions for images
      (let ((l image-file-name-extensions))
        (while
            (let ((f (concat (file-name-sans-extension (buffer-file-name))
                             "."
                             (car l))))
              ;; see if a file matches, might be best also to check
              ;; if file is up to date TODO:PP
              (if (file-exists-p f)
                  (progn (auto-image-file-mode 1)
                         ;; OK, this is ugly, I would need to
                         ;; know how I can reload a file in an existing buffer
						 (message "file %s" f)
						 (shell-command (concat "open -a Preview " f))
                         ;; (if (get-buffer "*preview*")
				  		 ;; 	 (let ((last-window	(get-buffer-window "*preview*")))
				  		 ;; 	   (kill-buffer "*preview*") 
				  		 ;; 	   (set-buffer (find-file-noselect f))
				  		 ;; 	   (rename-buffer "*preview*")
				  		 ;; 	   (if (null last-window)
				  		 ;; 		   (display-buffer (get-buffer "*preview*"))
				  		 ;; 		 (progn
				  		 ;; 		   (set-window-buffer last-window "*preview*")
				  		 ;; 		   last-window
				  		 ;; 		   ))
				  		 ;; 	   )
				  		 ;;   ;; else
				  		 ;;   (progn
				  		 ;; 	 (set-buffer (find-file-noselect f))
				  		 ;; 	 (rename-buffer "*preview*")
				  		 ;; 	 (display-buffer (get-buffer "*preview*")))) 

                         ;; stop iterating
                         '())
                ;; will stop iterating when l is nil
                (setq l (cdr l)))))
		;; each extension tested and nothing found, let user know
		(when (eq l '())
		  (message "No image found.")))))) 

;; open -a Preview 1.png

(spacemacs/set-leader-keys
  (concat vinurs/graphviz-key-binding-prefixes "c") 'compile
  (concat vinurs/graphviz-key-binding-prefixes "v") 'graphviz-dot-view
  (concat vinurs/graphviz-key-binding-prefixes "p") 'new1-graphviz-dot-preview
  (concat vinurs/graphviz-key-binding-prefixes "P") 'graphviz-dot-preview
  ) 



(provide 'graphviz-dot-mode-settings)

;;; graphviz-dot-mode-settings.el ends here
