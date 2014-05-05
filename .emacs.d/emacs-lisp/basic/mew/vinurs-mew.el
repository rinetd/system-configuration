;;; vinurs-mew.el --- 

;; Copyright 2012 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)vinurs-mew.el,v 0.0 2012/07/04 22:37:42 vinurs Exp $
;; Changed: <vinurs 07/05/2012 16:53:31>
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
;;   (require 'vinurs-mew)




;;; Code:

(provide 'vinurs-mew)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;; mew-pop-size设置成0时，pop邮件大小没有限制
(setq mew-pop-size 0)
;; 不删除服务器上的邮件
(setq mew-pop-delete nil)
(setq mew-use-unread-mark t)
(setq mew-use-full-window t)
;;Mew
;--------------------
;回复
(setq mew-summary-reply-with-citation-position 'body)
(setq mew-cite-fields '("Date:" "From:"))
(setq mew-cite-format "\n\nOn %s %s wrote:\n")
(add-hook 'mew-before-cite-hook 'mew-header-goto-body)
(add-hook 'mew-draft-mode-newdraft-hook 'mew-draft-insert-signature)
;签名档 请确认你写好了签名文件，不自动加分隔符
;; (setq mew-signature-file "~/Mail/signature")
;; (setq mew-signature-as-lastpart t)
;; (setq mew-signature-insert-last t)
;Spam
(setq mew-summary-form-mark-spam t)
;密码缓存
(setq mew-use-cached-passwd t)
;GPG签名设置（非加密） 首先确认你有没有GPG ID。
;; (setq mew-pgp-ascii-suffix "84599A3C")
;; (setq mew-protect-privacy-always t)
;; (setq mew-protect-privacy-always-type 'pgp-signature)

;单帐号设置
;; (setq mew-proto "%")
;; (setq mew-user "haiyuan.vinurs")
;; (setq mew-name "vinurs")
;; (setq mew-mail-domain "gmail.com")
;; (setq mew-imap-server "imap.gmail.com")
;; (setq mew-imap-user "haiyuan.vinurs@gmail.com")
;; (setq mew-imap-auth t)
;; (setq mew-imap-ssl t)
;; (setq mew-imap-ssl-port "993")
;; (setq mew-smtp-auth t)
;; (setq mew-smtp-ssl t)
;; (setq mew-smtp-ssl-port "465")
;; (setq mew-smtp-user "haiyuan.vinurs@gmail.com")
;; (setq mew-smtp-server "smtp.gmail.com")
;; (setq mew-ssl-verify-level 0) ;;没有会导致验证失败

;帐号设置
(setq mew-config-alist
      '(("default"
         (proto "%")
         ("user"         "haiyuan.vinurs")
         ("name"         "vinurs")
         ("mail-domain"  "gmail.com")
         ("imap-server"  "imap.gmail.com")
         ("imap-user" "haiyuan.vinurs@gmail.com")
         ("imap-auth" t)
         ("imap-ssl" t)
         ("imap-ssl-port" "993")
         (smtp-auth t)
         (smtp-ssl t)
         (smtp-ssl-port "465")
         (smtp-user "haiyuan.vinurs@gmail.com")
         (smtp-server "smtp.gmail.com")
         (ssl-verify-level 0)
     )
        ("victor"
         (proto "%")
         ("user"         "haiyuan.victor")
         ("name"         "victor")
         ("mail-domain"  "gmail.com")
         ("imap-server"  "imap.gmail.com")
         ("imap-user" "haiyuan.victor@gmail.com")
         ("imap-auth" t)
         ("imap-ssl" t)
         ("imap-ssl-port" "993")
         (smtp-auth t)
         (smtp-ssl t)
         (smtp-ssl-port "465")
         (smtp-user "haiyuan.victor@gmail.com")
         (smtp-server "smtp.gmail.com")
         (ssl-verify-level 0)
     )
))


;; 保存密码到内存，而不是写到文件
(setq mew-use-cached-passwd t)
;; Mew运行时保存密码到内存，退出时加密保存到文件，有主密码
(setq mew-use-master-passwd t)

(setq mew-charset-m17n "utf-8")
(setq mew-internal-utf-8p t)

(setq mew-prog-text/html         'mew-mime-text/html-w3m) ;; See w3m.el
(setq mew-prog-text/html-ext     "/usr/bin/firefox")

(setq mew-prog-text/xml         'mew-mime-text/html-w3m) ;; See w3m.el
(setq mew-prog-text/xml-ext     "/usr/bin/firefox")

(setq mew-prog-application/xml         'mew-mime-text/html-w3m)
(setq mew-prog-application/xml-ext     "/usr/bin/firefox")

(setq mew-prog-application/X-Dvi         "/usr/bin/xdvi")

;; ;;使用w3m 
(setq mew-mime-multipart-alternative-list '("text/html" "text/plain" "*."))
(condition-case nil
    (require 'mew-w3m)
  (file-error nil))
(setq mew-use-w3m-minor-mode t)
(setq mew-w3m-auto-insert-image t)

(load "biff")
(setq mew-use-biff t)  ;; 设置使用Biff检查邮箱是否有新邮件，默认为5分钟。如果有新邮件，则在emacs的状态栏显示Mail(n)的提示—n表示新邮件数目。
(setq mew-use-biff-bell t)  ;; 设置嘟嘟声通知有新邮件
(setq mew-biff-interval 1) ;; 设置自动检查新邮件的时间间隔，单位：分钟;这个值一定要小于下面的timer-unit和lifetime值，这个可以使用describe-variable查看一下
(setq mew-pop-biff-interval 3)
(setq mew-passwd-timer-unit 60)       ; 60 minutes = 1 hour                                            
(setq mew-passwd-lifetime 24)         ; timer-unit x 24 = 24 hours




;;; vinurs-mew.el ends here
