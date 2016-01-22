;;; init-powerline.el --- 

;; Copyright 2016 zhanghaiyuan
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)init-powerline.el,v 0.0 2016/01/21 10:18:39 vinurs Exp $
;; Changed: <vinurs 01/22/2016 12:10:04>
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
;;   (require 'init-powerline)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; (defface powerline-active1 '((t (:background "grey22" :inherit mode-line)))
;;   "Powerline face 1."
;;   :group 'powerline)

;; (defface powerline-active2 '((t (:background "grey40" :inherit mode-line)))
;;   "Powerline face 2."
;;   :group 'powerline)

;; (defface powerline-inactive1
;;   '((t (:background "grey11" :inherit mode-line-inactive)))
;;   "Powerline face 1."
;;   :group 'powerline)

;; (defface powerline-inactive2
;;   '((t (:background "grey20" :inherit mode-line-inactive)))
;;   "Powerline face 2."
;;   :group 'powerline)

;; 重新定义powerline face
(defface powerline-active1 '((t (:background "red" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active2 '((t (:background "blue" :inherit mode-line)))
  "Powerline face 2."
  :group 'powerline)

(defface powerline-inactive1
  '((t (:background "red" :inherit mode-line-inactive)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive2
  '((t (:background "red" :inherit mode-line-inactive)))
  "Powerline face 2."
  :group 'powerline)


;;;###autoload
(defun powerline-vinurs-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
														  (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (when powerline-display-buffer-size
                                       (powerline-buffer-size nil 'l))
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info nil 'l))
                                     (powerline-buffer-id nil 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) face2 'l))))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
									 (unless window-system
									   (powerline-raw (char-to-string #xe0a1) face1 'l))
									 (powerline-raw "%4l" face1 'l)
									 (powerline-raw ":" face1 'l)
									 (powerline-raw "%3c" face1 'r)
									 (funcall separator-right face1 mode-line)
									 (powerline-raw " ")
									 (powerline-raw "%6p" nil 'r)
                                     (when powerline-display-hud
                                       (powerline-hud face2 face1)))))
					 (concat (powerline-render lhs)
							 (powerline-fill face2 (powerline-width rhs))
							 (powerline-render rhs)))))))


;; (powerline-default-theme)
;; 用我自己定义的theme
(powerline-vinurs-theme)
;; 这个命令可以恢复到之前的modeline配置
;; (powerline-revert)


(provide 'init-powerline)

;;; init-powerline.el ends here
