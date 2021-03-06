;;; vinurs-basic.el --- 

;; Copyright 2010 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: victor-basic.el,v 0.0 2010/05/23 15:15:02 victor Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the tems of the GNU General Public License as published by
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
;;   (require 'victor_basic)

;;; Code:

(provide 'vinurs-basic)
(eval-when-compile
  (require 'cl))



;; 编码设置:utf-8之类，所有的文件全部以utf8保存
(require 'vinurs-coding-settings)



;; 个人的一些配置
;; 名字设置，邮件地址设置之类
(require 'personality)


;; emacs的服务端客户端模式配置
(require 'vinurs-server-client)


;; basic misc functions
;; 各种小功能的配置
(require 'vinurs-basic-misc)



;; 启动stardict辞典
(require 'victor-stardict)

;; ;; 打开压缩文件时自动解压缩
;; ;; 必须放在session前面
;; (auto-compression-mode 1)


;; ;; emacs vi mode
(require 'victor-emacs-vi)



;; 所有跟buffer相关的设定,例如关闭buffer
;;(require 'victor-allbuffers-setting)

;; templates for create a new file
(require 'victor-template)



;; 一行太长的时候自动换行
(setq truncate-lines t)
;; 不显示工具栏，碍眼
(tool-bar-mode -1)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; 支持终端下面跟外部粘帖，这个需要xsel的支持
;; use xsel to copy/paste in emacs-nox
(unless window-system
   (when (getenv "DISPLAY")
     (defun xsel-cut-function (text &optional push)
       (with-temp-buffer
         (insert text)
         (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
     (defun xsel-paste-function()
       (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
         (unless (string= (car kill-ring) xsel-output)
           xsel-output )))
     (setq interprogram-cut-function 'xsel-cut-function)
     (setq interprogram-paste-function 'xsel-paste-function)
     ))


;; 不显示Emacs的开始画面
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; 不要总是没完没了的问yes or no, 为什么不能用y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; 不要闪烁光标, 烦不烦啊
(blink-cursor-mode -1)
;; 不显示右侧滚动条
(scroll-bar-mode 0)
;; 这个不要删，为了不显示右侧滚动条所以这个右侧显示就先注释掉了
;; (customize-set-variable 'scroll-bar-mode 'right)

;; 防止页面滚动时跳动,scroll-margin 3可以在靠近屏幕边沿3行时就开始滚动,可以很好的看到上下文
(setq scroll-margin 6
      scroll-conservatively 10000)


;; 没有提示音,也不闪屏
(setq ring-bell-function 'ignore)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;; 增量搜索的时候不能使用c-h来删除，只能使用del来删除，增加这个以后就可以使用c-h来删除了
(define-key isearch-mode-map [(control h)] 'isearch-delete-char)


(setq system-time-locale "C")


;;;设置标题栏显示文件的完整路径名  
 (setq frame-title-format  
    '("vinurs@知行合一^-^--PATH:%S" (buffer-file-name "%f"  
     (dired-directory dired-directory "%b"))))


;;关闭菜单栏.
;; (menu-bar-mode nil) 


(setq visible-bell t)

;; 把缺省到major mode设置为text-mode,而不是几乎什么功能也没有
(setq default-major-mode 'text-mode)


;;设置emacs自动保存
(require 'victor-backup)
(setq auto-save-mode t)
;;击键100次自动保存
(setq auto-save-interval 300)
(setq auto-save-timeout 300)

;;show the time
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(setq display-time-format "%Y-%m-%d %A %H:%M")

;;时间 戳设置，设定文档上次保存到信息
;;只要在文档里有里Time-stamp:的设置，就会自动保存时间戳
;;启用time-stamp
(setq time-stamp-active t)
;;去掉time-stamp的警告
(setq time-stamp-warn-inactive t)
;;设置time-stamp的格式
(setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")
;;修改时间戳提示字符
(setq time-stamp-start "Changed:[  \t]+\\\\?[\"<]+")
(setq time-stamp-end: "\n")
;;前15行的时间戳提示符有效
(setq time-stamp-line-limit 15)
;;将修改时间戳的动作添加到保存文件动作里
(add-hook 'write-file-hooks 'time-stamp)


;;在minibuff上面可以显示列号，行号
(column-number-mode t)

;;tab键长度设置成4
(setq default-tab-width 4)


;; 退出的时候保存上次的光标位置
(require 'saveplace)
(setq-default save-place t)
;;设置 .emacs-places 文件的存储路径
(setq save-place-file "~/.emacs.d/.emacs-places")

;; gpg
(require 'vinurs-gpg)

;; dired
(require 'vinurs-dired)



;; use only one desktop
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name ".emacs-desktop")

;; 版本控制
(require 'vinurs-version-control)

;; ido模式
;; (ido-mode t)

;; basic global keybinds
(require 'vinurs-basic-global-keybind)

