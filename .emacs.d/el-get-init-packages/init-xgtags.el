;;; init-xgtags.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-xgtags.el,v 0.0 2013/08/14 13:05:34 vinurs Exp $
;; Changed: <vinurs 06/03/2014 11:28:12>
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



(defface xgtags-match-face
  '((((class color) (background red))
     (:foreground "cyan"))
    (((class color) (background light))
     (:foreground "magenta"))
    (t (:bold t)))
  "Face used to highlight function name in the *xgtags* buffer."
  :group 'xgtags)

(defface xgtags-match-selected-face
  '((((class color) (background red))
     (:foreground "cyan" :bold t))
    (((class color) (background light))
     (:foreground "magenta" :bold t))
    (t (:bold t)))
  "Face used to highlight selected function name in the *xgtags* buffer."
  :group 'xgtags)

(defface xgtags-file-face
  '((((class color) (background red))
     (:foreground "yellow"))
    (((class color) (background light))
     (:foreground "blue"))
    (t (:bold t)))
  "Face used to highlight file name in the *xgtags* buffer."
  :group 'xgtags)

(defface xgtags-file-selected-face
  '((((class color) (background red))
     (:foreground "yellow" :bold t))
    (((class color) (background light))
     (:foreground "blue" :bold t))
    (t (:bold t)))
  "Face used to highlight selected file name in the *xgtags* buffer."
  :group 'xgtags)

(defface xgtags-line-number-face
  '((((class color) (background red))
     (:foreground "red"))
    (((class color) (background light))
     (:foreground "red"))
    (t (:bold t)))
  "Face used to highlight line number in the *xgtags* buffer."
  :group 'xgtags)

(defface xgtags-line-number-selected-face
  '((((class color) (background red))
     (:foreground "red" :bold t))
    (((class color) (background light))
     (:foreground "red" :bold t))
    (t (:bold t)))
  "Face used to highlight selected line number in the *xgtags* buffer."
  :group 'xgtags)

(defface xgtags-line-face
  '((((class color) (background red))
     (:foreground "green"))
    (((class color) (background light))
     (:foreground "black"))
    (t (:bold nil)))
  "Face used to highlight the rest of line in the *xgtags* buffer."
  :group 'xgtags)

(defface xgtags-line-selected-face
  '((((class color) (background red))
     (:foreground "green" :bold t))
    (((class color) (background light))
     (:foreground "black" :bold t))
    (t (:bold nil)))
  "Face used to highlight the rest of line in the *xgtags* buffer."
  :group 'xgtags)


;;; init-xgtags.el ends here
