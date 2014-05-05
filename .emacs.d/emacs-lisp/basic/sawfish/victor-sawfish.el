;;; victor-sawfish.el --- 

;; Copyright 2012 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-sawfish.el,v 0.0 2012/03/27 19:47:23 vinurs Exp $
;; Changed: <vinurs 03/27/2012 19:53:13>
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
;;   (require 'victor-sawfish)




;;; Code:

(provide 'victor-sawfish)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(require 'sawfish)


;;; INSTALLATION:
;;
;; o Drop sawfish.el somwehere into your `load-path'. Try your site-lisp
;;   directory for example (you might also want to byte-compile the file).
;;
;; o Add autoloads for the various sawfish functions to ~/.emacs. At the
;;   very least you want to do something like:
;;
;;   (autoload 'sawfish-mode "sawfish" "sawfish-mode" t)
;;
;; o Add the following to ~/.emacs to ensure that sawfish mode is used when
;;   you go to edit sawfish code:
;;
;;   (setq auto-mode-alist (cons '("\\.sawfishrc$"  . sawfish-mode) auto-mode-alist)
;;         auto-mode-alist (cons '("\\.jl$"         . sawfish-mode) auto-mode-alist)
;;         auto-mode-alist (cons '("\\.sawfish/rc$" . sawfish-mode) auto-mode-alist))


(autoload 'sawfish-mode "sawfish" "sawfish-mode" t)

;; o Add the following to ~/.emacs to ensure that sawfish mode is used when
;;   you go to edit sawfish code:

(setq auto-mode-alist (cons '("\\.sawfishrc$"  . sawfish-mode) auto-mode-alist)
      auto-mode-alist (cons '("\\.jl$"         . sawfish-mode) auto-mode-alist)
      auto-mode-alist (cons '("\\.sawfish/rc$" . sawfish-mode) auto-mode-alist))




;;; victor-sawfish.el ends here
