;;; init-mew.el --- 

;; Copyright 2015 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-mew.el,v 0.0 2015/01/20 11:12:09 vinurs Exp $
;; Changed: <vinurs 01/22/2015 07:23:35>
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
;;   (require 'init-mew)




;;; Code:

(provide 'init-mew)
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

;;设定将密码保存一段时间，默认20分钟 
(setq mew-use-cached-passwd t)
;; 单位为分钟，多少分钟之后cached的密码失效
(setq mew-passwd-timer-unit 999)
;; *Minutes of timer unit to cancel the cached passwords.
;; 多少个mew-passwd-timer-unit之后停止cache密码
(setq mew-passwd-lifetime 999)

;; 用utf8来发送邮件
(setq mew-charset-m17n "utf-8")
(setq mew-internal-utf-8p t)

;; ----------------------------------------------- ;;
;; Default paths
(setq mew-mail-path "~/.Mail-Mew")
(setq mew-conf-path mew-mail-path)

;; addrbook
;; (setq mew-addrbook-file "~/live/dotfiles/.Addressbook")

;; ----------------------------------------------- ;;
;; look and feel
(setq mew-window-use-full t)
(setq mew-underline-lines-use t)
(setq mew-use-fancy-thread t)
(setq mew-use-fancy-highlight-body t)
(setq mew-fancy-highlight-body-prefix-width 10)
(setq mew-highlight-body-regex-comment "^[;#?%]+.*")
(setq mew-prog-imls-arg-list '("--thread=yes" "--indent=2"))
;;(setq mew-use-highlight-mouse-line t)
;; ceci pour remplacer le curseur par une barre
;; colorée, c'est selon les goûts
(setq mew-use-highlight-cursor-line t)
(setq mew-highlight-cursor-line-face 'underline)
(setq mew-use-cursor-mark t)

;; 设置邮件显示栏目
(setq mew-summary-form
      '(type (5 date) " " (14 from) " " t (30 subj) "|" (0 body)))
(setq mew-sort-default-key "x-date-count")

;; biff
;; 邮件通知提醒
(load "biff")
(setq mew-use-biff t)
(setq mew-use-biff-bell t)
;;这个值一定要小于下面的timer-unit和lifetime值，这个可以使用describe-variable查看一下
;; 这里设置每隔5分钟检查一次
(setq mew-biff-interval 1)
;; 有新邮件了通过声音提醒
;TODO: 这里还需要增加linux上面的命令行音乐播放器
(setq mew-arrivedmail-pending 0)
(defadvice mew-biff-bark (before mew-biff-sound (arg))
  "Play a sound, if new Mail arrives"
  (cond ((and (> arg 0) (> arg mew-arrivedmail-pending))
     (setq mew-arrivedmail-pending arg)
     (start-process-shell-command    "mail-sound"   "*Messages*"
                                      "afplay ~/system-configuration/tones/get-mail.wav"))
                  ;; replace sndplay with your favorite command to
                  ;; play a sound-file
    ((= arg 0)
     (if (> mew-arrivedmail-pending 0)
         (setq mew-arrivedmail-pending 0)))))
(ad-activate 'mew-biff-bark)



;; html邮件相关设置
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



;; mew启动时自动获取邮件
(setq mew-auto-get t)

(setq mew-config-alist
      '(
        (default
          ;; vinurs <zhang.haiyuan@embedway.com>, name就是前面的显示
          (name         .  "vinurs")
          ;; 邮件登陆帐号
          (user         .  "zhang.haiyuan")
          (mail-domain  .  "embedway.com")
          ;; (mailbox-type  imap)
          ;; 使用imap协议来收邮件
          (proto  "%")
          ;; imap设置成0时，imap邮件大小没有限制
          (imap-size . 0)
          ;; 不删除服务器上面的邮件
          (imap-delete nil)
          (imap-server           "imap.embedway.com")
          (imap-user             "zhang.haiyuan@embedway.com")
          ;; 使用pop3协议来收邮件
          ;; ("pop-server"   .  "pop3.embedway.com")
          ;; ("pop-port"     .  "110")
          ;; ("pop-user"     .  "zhang.haiyuan@embedway.com") 
          ;; ("pop-auth"     .  pass)
          (smtp-server  .  "smtp.embedway.com")
          (smtp-port    .  "25")
          (smtp-user    .  "zhang.haiyuan@embedway.com")
          (smtp-auth-list  .  ("PLAIN" "LOGIN" "CRAM-MD5"))
          )
        ;TODO: 配置好gmail收发邮件
        ;; (gmail
        ;;  (proto                 "%")
        ;;  (imap-server           "imap.gmail.com")
        ;;  (imap-user             "haiyuan.vinurs@gmail.com")
        ;;  ;; vinurs <zhang.haiyuan@embedway.com>, name就是前面的显示
        ;;  ("name"         .  "vinurs")
        ;;  ;; 邮件登陆帐号
        ;;  ("user"         .  "haiyuan.vinurs")
        ;;  ("mail-domain"  .  "gmail.com")
        ;;  ("smtp-server"  .  "smtp.gmail.com")
        ;;  ("smtp-port"    .  "25")
        ;;  ("smtp-user"    .  "haiyuan.vinurs@gmail.com")
        ;;  ("smtp-auth-list"  .  ("PLAIN" "LOGIN" "CRAM-MD5")))
        )
      )

;; (setq mew-config-alist
;;       '(
;;         ;; Default fetch mailbox is IMAP
;;         (default
;;          (mailbox-type          imap)
;;          (proto                 "%")
;;          (imap-server           "imap.gmail.com")
;;          (imap-user             "imapuser@gmail.com")
;;          (name                  "vinurs")
;;          (user                  "haiyuan.vinurs")
;;          (mail-domain           "gmail.com")
;;          (imap-size             0)
;;          (imap-delete           t)
;;          (imap-queue-folder     "%queue")
;;          (imap-trash-folder     "%Trash") ;; This must be in concile with your IMAP box setup
;;          (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5")) 
;;          (smtp-user             "smtpuser@gmail.com")
;;          (smtp-server           "smtp.gmail.com")
;;          )
        
;;         ))

       
;; (setq mew-config-alist
;;       '(
;;         ;; Default fetch mailbox is IMAP
;;         ;; (default
;; 		;;   (mailbox-type          imap)
;; 		;;   (proto                 "%")
;; 		;;   (imap-server           "imap.embedway.com")
;; 		;;   (imap-user             "imapuser@embedway.com")
;; 		;;   (name                  "vinurs")
;; 		;;   (user                  "zhang.haiyuan")
;; 		;;   (mail-domain           "embedway.com")
;; 		;;   (imap-size             0)
;; 		;;   (imap-delete           t)
;; 		;;   (imap-queue-folder     "%queue")
;; 		;;   (imap-trash-folder     "%Trash") ;; This must be in concile with your IMAP box setup
;; 		;;   (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5")) 
;; 		;;   (smtp-user             "smtpuser@embedway.com")
;; 		;;   (smtp-server           "smtp.embedway.com"))
;; 		;; embedway outer net mail
;; 		(default
;;          (mailbox-type          pop)
;;          (proto                 "$")
;;          (pop-server            "pop3@embedway.com")
;;          (name                  "vinurs")
;;          (user                  "zhang.haiyuan@embedway.com")
;;          (mail-domain           "embedway.com")
;;          (pop-auth              pass)
;;          (pop-user              "zhang.haiyuan@embedway.com")
;;          (smtp-user             "zhang.haiyuan@embedway.com")
;;          (smtp-server           "smtp.embedway.com")
;; 		 )
;; 		)
;; 	  )




;;; init-mew.el ends here
