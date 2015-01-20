;;; init-mew.el --- 

;; Copyright 2015 zhanghaiyuan
;;
;; Author: zhang.haiyuan@server.embedway.com
;; Version: $Id: @(#)init-mew.el,v 0.0 2015/01/20 11:12:09 vinurs Exp $
;; Changed: <vinurs 01/20/2015 19:59:20>
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

(setq mew-config-alist
      '(
        (default
          ;; vinurs <zhang.haiyuan@embedway.com>, name就是前面的显示
          ("name"         .  "vinurs")
          ;; 邮件登陆帐号
          ("user"         .  "zhang.haiyuan")
          ("mail-domain"  .  "embedway.com")
          ("pop-server"   .  "pop3.embedway.com")
          ("pop-port"     .  "110")
          ("pop-user"     .  "zhang.haiyuan@embedway.com") 
          ("pop-auth"     .  pass)
          ("smtp-server"  .  "smtp.embedway.com")
          ("smtp-port"    .  "25")
          ("smtp-user"    .  "zhang.haiyuan@embedway.com")
          ("smtp-auth-list"  .  ("PLAIN" "LOGIN" "CRAM-MD5"))))
      
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
