;;; init-xgtags-extension.el --- 

;; Copyright 2013 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-xgtags-extension.el,v 0.0 2013/08/14 13:10:40 vinurs Exp $
;; Changed: <vinurs 09/10/2013 09:48:10>
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
;;   (require 'init-xgtags-extension)




;;; Code:

(provide 'init-xgtags-extension)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(add-hook 'c-mode-common-hook
          (lambda ()
            (xgtags-mode 1)
            ))


;; remap the key


;; using gtags update the file when save
;; (add-hook 'after-save-hook 'update-single-file)

;; (call-process "gtags" nil t)

;; (call-process "pwd" nil t)/home/vinurs/.emacs.d/el-get-init-packages


;; --single-update file
;;        Update tag files for single file.  It is considered that file was updated, and other files were not updated.  The file must be relative path name from  the  current  direc‐
;;        tory.  This option implies the -i option.  If the file is new then --single-update is ignored, and the processing is automatically switched to normal incremental updating.

;; (defun update-single-file ()
;;   "update single file using "
;;   (if (call-process "gtags" nil)
;;       (message "hello"))
;;   )




;;; init-xgtags-extension.el ends here
