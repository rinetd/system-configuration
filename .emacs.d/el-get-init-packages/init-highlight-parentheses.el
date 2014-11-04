;; for highlight-parentheses


(setq hl-paren-colors '("cyan" "purple" "magenta" "green" "blue" 
			"brown" "orange2" "salmon2" "wheat4"))


(am-add-hooks
 `(find-file-hook help-mode-hook Man-mode-hook log-view-mode-hook
                  compilation-mode-hook gdb-mode-hook lisp-interaction-mode-hook
                  browse-kill-ring-mode-hook completion-list-mode-hook
                  inferior-ruby-mode-hook custom-mode-hook Info-mode-hook svn-log-edit-mode-hook
                  package-menu-mode-hook dired-mode-hook apropos-mode-hook)
 'highlight-parentheses-mode)


;; TODO: 增加加粗当前括号的功能


(provide 'init-highlight-parentheses)

