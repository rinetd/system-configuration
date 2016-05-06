(when (spacemacs/system-is-mac)
  ;; key bindings
  ;; for emacs
  (setq mac-right-option-modifier 'control)
  (setq mac-left-option-modifier 'alt)

  ;;(setq mac-command-modifier 'control)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

;; 代码折叠相关快捷键设定
(spacemacs/set-leader-keys "mha" 'hs-hide-all) 
(spacemacs/set-leader-keys "mhA" 'hs-show-all) 
(spacemacs/set-leader-keys "mhb" 'hs-hide-block) 
(spacemacs/set-leader-keys "mhB" 'hs-show-block) 
(spacemacs/set-leader-keys "mhi" 'hs-hide-initial-comment-block) 
;; 这个是比较好用的
(spacemacs/set-leader-keys "mht" 'hs-toggle-hiding)






