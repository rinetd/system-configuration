;;; victor-fvwm.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-fvwm.el,v 0.0 2011/08/07 09:25:27 victor Exp $
;; Changed: <victor 08/07/2011 09:26:13>
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
;;   (require 'victor-fvwm)




;;; Code:

(provide 'victor-fvwm)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(load "fvwm-mode")  
;;Autoload this mode
(autoload 'fvwm-mode "fvwm-mode" "Mode for editing fvwm files" t)
(setq auto-mode-alist 
      (cons '("\\.fvwm2rc$\\|\\.fvwmrc$" . fvwm-mode) auto-mode-alist))

;;; victor-fvwm.el ends here
