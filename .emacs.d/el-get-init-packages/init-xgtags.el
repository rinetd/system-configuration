;;; init-xgtags.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-xgtags.el,v 0.0 2013/08/14 13:05:34 vinurs Exp $
;; Changed: <vinurs 06/05/2014 00:18:31>
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
;;   (require 'init-xgtags)




;;; Code:

(provide 'init-xgtags)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require 'xgtags)

;;

(add-hook 'c-mode-common-hook
          (lambda ()
            (xgtags-mode 1)))

(defun xgtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))


(defun xgtags-update ()
  "Make GTAGS incremental update"
  (call-process "global" nil nil nil "-u"))


(defun xgtags-update-hook ()
  (when (xgtags-root-dir)
    (xgtags-update)))


(add-hook 'after-save-hook #'xgtags-update-hook)




(defface vinurs-xgtags-line-selected-face
  '((((class color) (background red))
     (:foreground "green" :bold t))
    (((class color) (background light))
     (:foreground "red" :bold t))
    (t (:bold nil)))
  "Face used to highlight the rest of line in the *xgtags* buffer."
  :group 'xgtags)


(defun xgtags--insert-tag (tag)
  "Insert a single tag TAG at point in the current buffer"
  (let ((start (point))
        (query (xgtags--tag-query tag))
        (line (xgtags--tag-line tag))
        (match (xgtags--tag-match tag))
        (selected-p (eq tag xgtags--selected-tag)))
    (xgtags--insert-with-face query
                              (if selected-p
                                  'xgtags-match-selected-face
                                'xgtags-match-face))
    (insert "[")
    (xgtags--insert-with-face (number-to-string line)
                              (if selected-p
                                  'xgtags-line-number-selected-face
                                'xgtags-line-number-face))
    (when match
      (insert "]\t\t")
      (xgtags--insert-with-face match (if selected-p
                                          'vinurs-xgtags-line-selected-face
                                        'xgtags-line-face)))
    (put-text-property start (point) 'xgtags-tag tag)))


;;; init-xgtags.el ends here
