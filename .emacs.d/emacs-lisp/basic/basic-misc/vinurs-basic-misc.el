;;; victor-basic-misc.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-basic-misc.el,v 0.0 2011/04/28 07:56:19 victor Exp $
;; Changed: <vinurs 01/16/2015 23:41:39>
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
;;   (require 'victor-basic-misc)




;;; Code:

(provide 'victor-basic-misc)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(require 'vinurs-basic-functions)

;; 设置info目录路径 
(add-to-list 'Info-default-directory-list "/usr/share/info")

;; 配置path环境变量
(setenv "PATH" (concat "/usr/local/bin;" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))


;; 高亮当前行
(am-add-hooks
 `(find-file-hook help-mode-hook Man-mode-hook log-view-mode-hook chart-mode-hook
                  compilation-mode-hook gdb-mode-hook lisp-interaction-mode-hook
                  browse-kill-ring-mode-hook completion-list-mode-hook hs-hide-hook
                  inferior-ruby-mode-hook custom-mode-hook Info-mode-hook svn-log-edit-mode-hook
                  package-menu-mode-hook dired-mode-hook apropos-mode-hook svn-log-view-mode-hook
                  diff-mode-hook emacs-lisp-mode-hook ibuffer-mode-hook html-mode-hook
                  w3m-mode-hook data-debug-hook debugger-mode-hook text-mode-hook color-theme-mode-hook
                  semantic-symref-results-mode-hook sh-mode-hook groovy-mode-hook)
 (lambda()
   (if (not (memq major-mode '(image-mode)))
       (hl-line-mode 0))))








;;; victor-basic-misc.el ends here
