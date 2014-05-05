;;; victor-backup.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-backup.el,v 0.0 2011/06/19 11:27:51 victor Exp $
;; Changed: <victor 06/19/2011 11:28:09>
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
;;   (require 'victor-backup)




;;; Code:

(provide 'victor-backup)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;;set the backup directory
(require 'backup-dir)

(setq bkup-backup-directory-info
	'((t "~/.Editing-bk" ok-create full-path)))
;;use backup function
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 1)
(setq kept-new-versions 3)
;;sliently delete the old backup files
(setq delete-old-versions t)
;;set backup method, just copy
(setq backup-by-copying t)


;;; victor-backup.el ends here
