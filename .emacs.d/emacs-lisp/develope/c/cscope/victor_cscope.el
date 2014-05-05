;;; victor_cscope.el --- 

;; Copyright 2010 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor_cscope.el,v 0.0 2010/12/06 14:15:31 victor Exp $
;; Changed: <vinurs 06/29/2012 11:19:09>
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
;;   (require 'victor_cscope)




;;; Code:

(provide 'victor_cscope)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



;;cscope profile
(add-hook 'c-mode-common-hook
	  '(lambda ()
	    (require 'xcscope)))
(require 'xcscope)

;;自动更新cscope数据库
(setq cscope-do-not-update-database nil)

;;terminal send different key sequences than emacs may be expecting. you need to provide translations for the terminal type in order to get emacs to work correctly. for example, i have this config to setup the terminal i use (the weird char is a literal "escape" char, which you can type in using "C-q <esc>":

(cond ((not window-system)
       (let ((map (if (boundp 'input-decode-map)
                      input-decode-map function-key-map)))
         ;; 这个为了防止在C-s的时候cpu使用率很高，所以只在cscope的这个map里面打开
         (define-key cscope-list-entry-keymap (kbd "RET") [return])
         ;; (define-key map (kbd "RET") [return])
         ;; (define-key map "[H" [return])

         (define-key map "[E" [(control return)])
         (define-key map "[F" [(control shift return)])
         ;; 这个只有在terminal下面这样设置才行
         (define-key map "[G" [(control semicolon)])
         
         ;; 我一般不用方向键的，太远了
         ;; 估计这个在不同的终端模拟器下面表现还不一样
         (define-key map "OA" (kbd "<C-up>"))
         (define-key map "OB" (kbd "<C-down>"))
         (define-key map "OC" (kbd "<C-right>"))
         (define-key map "OD" (kbd "<C-left>"))
         (define-key map "A" (kbd "<C-up>"))
         (define-key map "B" (kbd "<C-down>"))
         (define-key map "C" (kbd "<C-right>"))
         (define-key map "D" (kbd "<C-left>"))

         
         ;; (define-key map "OA" (kbd "<M-up>"))
         ;; (define-key map "OB" (kbd "<M-down>"))
         ;; (define-key map "OC" (kbd "<M-right>"))
         ;; (define-key map "OD" (kbd "<M-left>"))

         ;; (define-key map "[OA" (kbd "<M-C-up>"))
         ;; (define-key map "[OB" (kbd "<M-C-down>"))
         ;; (define-key map "[OC" (kbd "<M-C-right>"))
         ;; (define-key map "[OD" (kbd "<M-C-left>"))

         ;; (define-key map "[[17~" (kbd "<C-f6>"))
         ;; (define-key map "[[18~" (kbd "<C-f7>"))
         ;; (define-key map "[[19~" (kbd "<C-f8>"))
         ;; (define-key map "[[20~" (kbd "<C-f9>"))
         ;; (define-key map "[[21~" (kbd "<C-f10>"))
         ;; (define-key map "[[23~" (kbd "<C-f11>"))
         ;; (define-key map "[[24~" (kbd "<C-f12>"))

         ;; (define-key map "\e[1~" [home])
         ;; (define-key map "\e[4~" [end])
         ;; (define-key map "\e\e[1~" [M-home])
         ;; (define-key map "\e\e[4~" [M-end])
         )
       )
      )




;;; victor_cscope.el ends here
