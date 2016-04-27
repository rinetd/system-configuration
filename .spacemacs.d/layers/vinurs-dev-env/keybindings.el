(when (spacemacs/system-is-mac)
  ;; key bindings
  ;; for emacs
  ;; (setq mac-right-option-modifier 'control)
  ;; (setq mac-left-option-modifier 'alt)

  (setq mac-command-modifier 'control)
  ;; (setq mac-command-modifier 'meta)


  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )
