
;; 代码折叠相关快捷键设定
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



