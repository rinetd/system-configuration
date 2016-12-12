;;; graphviz-dot-mode-settings.el --- 

;; Copyright 2016 vinurs
;;
;; Author: vinurs@vinurs-mac.local
;; Version: $Id: @(#)graphviz-dot-mode-settings.el,v 0.0 2016/05/11 19:09:02 vinurs Exp $
;; Changed: <vinurs 12/12/2016 23:30:47>
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

(add-hook 'c-mode-common-hook
	 (lambda ()
			(hs-minor-mode 1)
			))

(add-hook 'graphviz-dot-mode-hook
  '(lambda ()

			;; 括号折叠
			(hs-minor-mode 1)

			;; compile dot files
			(spacemacs/set-leader-keys-for-major-mode 'graphviz-dot-mode
				 "c" 'compile) 
			;; preview
			(spacemacs/set-leader-keys-for-major-mode 'graphviz-dot-mode
				 "p" 'new1-graphviz-dot-preview) 

			)) 

(defun graphviz-dot-indent-line ()
   "Indent current line of dot code."
   (interactive)
   (if (bolp)
      (graphviz-dot-real-indent-line)
      (save-excursion
         (graphviz-dot-real-indent-line)))) 

;; 重新定义这个函数，貌似现在缩进有点问题
(defun graphviz-dot-real-indent-line ()
   "Indent current line of dot code."
   (beginning-of-line)
   (cond
      ((bobp)
         ;; simple case, indent to 0
         (indent-line-to 0))
      ((looking-at "^[ \t]*}[ \t]*$")
         ;; block closing, deindent relative to previous line
         (indent-line-to (save-excursion
                            (forward-line -1)
                            (if (looking-at "\\(^.*{[^}]*$\\)")
                               ;; previous line opened a block
                               ;; use same indentation
                               (current-indentation)
                               (max 0 (- (current-indentation) graphviz-dot-indent-width))))))
      ;; other cases need to look at previous lines
      (t
         (indent-line-to (save-excursion
                            (forward-line -1)
                            (cond
                               ((looking-at "\\(^.*{[^}]*$\\)")
                                  ;; previous line opened a block
                                  ;; indent to that line
                                  (+ (current-indentation) graphviz-dot-indent-width))
                               ((and (not (looking-at ".*\\[.*\\].*"))
                                   (looking-at ".*\\[.*")) ; TODO:PP : can be 1 regex
                                  ;; previous line started filling
                                  ;; attributes, intend to that start
                                  (search-forward "[")
                                  (current-column))
                               ((and (not (looking-at ".*\\[.*\\].*"))
                                   (looking-at ".*\\].*")) ; TODO:PP : "
                                  ;; previous line stopped filling
                                  ;; attributes, find the line that started
                                  ;; filling them and indent to that line
                                  (while (or (looking-at ".*\\[.*\\].*")
                                            (not (looking-at ".*\\[.*"))) ; TODO:PP : "
                                     (forward-line -1))
                                  (current-indentation))
                               (t
                                  ;; default case, indent the
                                  ;; same as previous NON-BLANK line
                                  ;; (or the first line, if there are no previous non-blank lines)
                                  (while (and (< (point-min) (point))
                                            (looking-at "^\[ \t\]*$"))
                                     (forward-line -1))
                                  ;; 寻找]
                                  (if (and (looking-at ".*\\].*")
                                         (not (looking-at ".*\\[.*")))
                                     (progn
                                        (while (or (looking-at ".*\\[.*\\].*")
                                                  (not (looking-at ".*\\[.*"))) ; TODO:PP : "
                                           (progn
                                              (forward-line -1)
                                              )
                                           )
                                        (current-indentation)
                                        )
                                     (progn
                                        (current-indentation)
                                        ))) ))) ))) 


(provide 'graphviz-dot-mode-settings)

;;; graphviz-dot-mode-settings.el ends here
