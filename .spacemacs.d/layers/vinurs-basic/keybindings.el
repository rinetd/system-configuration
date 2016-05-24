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
(spacemacs/set-leader-keys "ha" 'hs-hide-all) 
(spacemacs/set-leader-keys "hA" 'hs-show-all) 
(spacemacs/set-leader-keys "ht" 'hs-toggle-hiding) 





;; highlight相关快捷键定义
(spacemacs/set-leader-keys "hs" 'hlt-highlight-symbol) 
(spacemacs/set-leader-keys "hr" 'hlt-unhighlight-symbol) 
;; 其实highlight区域基本不常用，所以这里这个快捷键去掉
;; (spacemacs/set-leader-keys "hr" 'hlt-highlight-region) 
(spacemacs/set-leader-keys "hR" 'hlt-unhighlight-region) 
;; 设置highlight字体以及颜色



