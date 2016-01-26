;;; init-ggtags.el --- 

;; Copyright 2014 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-ggtags.el,v 0.0 2014/05/07 22:53:45 vinurs Exp $
;; Changed: <vinurs 01/26/2016 13:17:40>
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
;;   (require 'init-ggtags)




;;; Code:

(provide 'init-ggtags)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(keyfreq-mode 1)
(keyfreq-autosave-mode 1)


;;; init-ggtags.el ends here
