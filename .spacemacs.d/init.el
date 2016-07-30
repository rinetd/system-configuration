;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(message "start spacemacs init.el %s"
  (format-time-string"%a %H:%M:%S" (current-time)))

(push "~/.spacemacs.d/spacemacs+" load-path)
;;由菜单修改配置的东西将会保存在custom-file里
(setq custom-file "~/.spacemacs.d/custom.el")


;; first step
(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (load-file "~/.spacemacs.d/spacemacs+/dotspacemacs-init.el")
  )
(message "dotspacemacs/init end %s"
  (format-time-string"%a %H:%M:%S" (current-time)))


;; second step
(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (load-file "~/.spacemacs.d/spacemacs+/dotspacemacs-user-init.el")
  )
(message "dotspacemacs/user-init end %s"
  (format-time-string"%a %H:%M:%S" (current-time)))



;; third step
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
 You should not put any user code in this function besides modifying the variable
 values."
  (load-file "~/.spacemacs.d/spacemacs+/dotspacemacs-layers.el")
  )
(message "dotspacemacs/layers end %s"
  (format-time-string"%a %H:%M:%S" (current-time)))



;; last step
(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."
  (load-file "~/.spacemacs.d/spacemacs+/dotspacemacs-user-config.el") 
  )
(message "dotspacemacs/user-config end %s"
  (format-time-string"%a %H:%M:%S" (current-time)))


