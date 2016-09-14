;;; keybindings.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)keybindings.el,v 0.0 2016/08/26 16:59:26 vinurs Exp $
;; Changed: <vinurs 09/14/2016 17:11:38>
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
;;   (require 'keybindings)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; 括号折叠相关快捷键设定
;; 这个代码copy from https://emacs.stackexchange.com/questions/20922/hiding-and-showing-all-blocks-with-one-binding
(defun my-hs-toggle-all ()
  "If anything isn't hidden, run `hs-hide-all', else run `hs-show-all'."
  (interactive)
  (let ((starting-ov-count (length (overlays-in (point-min) (point-max)))))
    (hs-hide-all)
    (when (equal (length (overlays-in (point-min) (point-max))) starting-ov-count)
      (hs-show-all)))) 
(spacemacs/set-leader-keys "ha" 'my-hs-toggle-all) 
;; (spacemacs/set-leader-keys "ha" 'hs-hide-all) 
;; (spacemacs/set-leader-keys "hA" 'hs-show-all) 
(spacemacs/set-leader-keys "ht" 'hs-toggle-hiding) 




;; highlight相关快捷键定义
(spacemacs/set-leader-keys "hs" 'hlt-highlight-symbol) 
(spacemacs/set-leader-keys "hr" 'hlt-unhighlight-symbol) 
;; 其实highlight区域基本不常用，所以这里这个快捷键去掉
;; (spacemacs/set-leader-keys "hr" 'hlt-highlight-region) 
(spacemacs/set-leader-keys "hR" 'hlt-unhighlight-region) 
;; 设置highlight字体以及颜色

;; M-x命令
(spacemacs/set-leader-keys "ox" 'helm-M-x) 


(provide 'keybindings)

;;; keybindings.el ends here
