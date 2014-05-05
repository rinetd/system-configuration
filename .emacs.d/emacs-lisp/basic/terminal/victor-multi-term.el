;;; victor-multi-term.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor_mul_terminal.el,v 0.0 2011/02/17 18:17:16 victor Exp $
;; Changed: <victor 08/31/2011 07:46:55>
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
;;   (require 'victor_mul_terminal)




;;; Code:

(provide 'victor-multi-term)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;;load multi terminal

(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; create a new shell
(global-set-key (kbd "C-x n s") 'multi-term-and-rename)

(custom-set-variables
 '(term-default-bg-color "#000000")        ;; background color (black)
 '(term-default-fg-color "#dddd00"))       ;; foreground color (yellow)


(defun multi-term-and-rename (shell-name)
  "the function is used to new a shell term and rename the tern"
  (interactive "sPlease Input the new shell's buffer-name:")
  (multi-term)
  (rename-buffer shell-name)
  )

(defun term-settings ()
  "Settings for `term'."
  (defun term-mode-hook-settings ()
    "Settings for `term-mode-hook'"
    ;; emacs gui版本如果不把scroll-margin设为0
    ;; 当光标最屏幕底部时，有可能使得屏幕发生抖动
    (make-local-variable 'scroll-margin)
    (setq scroll-margin 0)
    (kill-buffer-when-shell-command-exit))

  (add-hook 'term-mode-hook 'term-mode-hook-settings))


(eval-after-load "term"
  `(term-settings))

;;; victor_mul_terminal.el ends here
