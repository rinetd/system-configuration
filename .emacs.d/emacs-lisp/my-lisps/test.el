;;; test.el --- 

;; Copyright 2011 victor
;;
;; Author: haiyuan.victor@gmail.com
;; Version: $Id: @(#)victor-load-path.el,v 0.0 2011/06/06 21:59:38 victor Exp $
;; Changed: <vinurs 04/01/2012 18:09:22>
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
;;   (require 'victor-load-path)




;;; Code:

(provide 'victor-load-path)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;; (defun my-add-subdirs-to-load-path (dir)

;;   (interactive)
;;   (let ((default-directory (concat dir "/")))
;;     (add-to-list 'load-path dir)
;;     (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;         (normal-top-level-add-subdirs-to-load-path))))
;; (directory-files DIRECTORY &optional FULL MATCH NOSORT)
;; (directory-files "./" "FULL")
;; (setq files
;;       (directory-files "./" "FULL"))
;; (message files)
;; (concatenate 'string 'files)
;; (concat (directory-files "./" "FULL"))

(setq pending ())
(defun add-subdirs-to-load-path (dir)
  "Add all subdirectories of dir directory to `load-path'.
More precisely, this uses only the subdirectories whose names
start with letters or digits; it excludes any subdirectory named `RCS'
or `CVS', and any subdirectory that contains a file named `.nosearch'."
  (interactive)
  (let* ((default-direct dir)
          dirs
          attrs
          )
    ;; This loop does a breadth-first tree walk on DIR's subtree,
    ;; putting each subdir into DIRS as its contents are examined.
    (setq dirs (directory-files dir "FULL"))
    (while dirs
      ;; if it's a directory, then add to loadpath, else, do nothing
      (setq attrs (file-attributes (car dirs)))
      (if (eq t (car attrs))
          (let ((tmp-file-name (pop dirs)))
            (setq pending
                  (cons tmp-file-name pending))
            )
        (pop dirs)
        )

    )))


(add-subdirs-to-load-path "~/")
pending

(setq nihao '(hah nihao gundan))
(pop nihao)
(setq test ())
(append '(niya) '(nihao) '(haha))
test
(while nihao
  (setq test
        (cons (pop nihao) test))
  (message "haha")
  )
(pop nihao)
test




;; Fix bug of `normal-top-level-add-subdirs-to-load-path'
;; which can not add directory which name end with ".elc?"
;; copy from emacs23 startup.el and modify it
(defun normal-top-level-add-subdirs-to-load-path ()
  "Add all subdirectories of current directory to `load-path'.
More precisely, this uses only the subdirectories whose names
start with letters or digits; it excludes any subdirectory named `RCS'
or `CVS', and any subdirectory that contains a file named `.nosearch'."
  (let (dirs
        attrs
        (pending (list default-directory)))
    ;; This loop does a breadth-first tree walk on DIR's subtree,
    ;; putting each subdir into DIRS as its contents are examined.
    (while pending
      (push (pop pending) dirs)
      (let* ((this-dir (car dirs))
             (contents (directory-files this-dir))
             (default-directory this-dir)
             (canonicalized (if (fboundp 'untranslated-canonical-name)
                                (untranslated-canonical-name this-dir))))
        ;; The Windows version doesn't report meaningful inode
        ;; numbers, so use the canonicalized absolute file name of the
        ;; directory instead.
        (setq attrs (or canonicalized
                        (nthcdr 10 (file-attributes this-dir))))
        (unless (member attrs normal-top-level-add-subdirs-inode-list)
          (push attrs normal-top-level-add-subdirs-inode-list)
          (dolist (file contents)
            ;; The lower-case variants of RCS and CVS are for DOS/Windows.
            (unless (member file '("." ".." "RCS" "CVS" "rcs" "cvs"))
              (when (and (string-match "\\`[[:alnum:]]" file)
                         ;; Avoid doing a `stat' when it isn't necessary
                         ;; because that can cause trouble when an NFS server
                         ;; is down.
                         (file-directory-p file))
                (let ((expanded (expand-file-name file)))
                  (unless (file-exists-p (expand-file-name ".nosearch"
                                                           expanded))
                    (setq pending (nconc pending (list expanded)))))))))))
    (if (equal window-system 'w32)
        (setq load-path (append (nreverse dirs) load-path))
      (normal-top-level-add-to-load-path (cdr (nreverse dirs))))))








(load "~/.emacs.d/emacs-lisp/my-lisps/add-subdirs.el")

;; 定义路径前缀，后面用起来才方便
(defconst my-emacs-path-prefix           "~/.emacs.d/" "我的emacs相关配置文件的路径")

;;(defconst my-emacs-my-lisps-path  (concat my-emacs-path-prefix "emacs-lisp/my-lisps/") "我自己写的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path-prefix "emacs-lisp/") "我下载的emacs lisp包的路径")


;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(my-add-subdirs-to-load-path my-emacs-lisps-path)
;;(my-add-subdirs-to-load-path my-emacs-my-lisps-path)



 

;;; victor-load-path.el ends here
