;;; vinurs-love-theme.el --- A color theme based on the tango palette

;; Copyright (C) 2013 Titus von der Malsburg <malsburg@posteo.de>

;; Author: Titus von der Malsburg <malsburg@posteo.de>
;; Maintainer: Titus von der Malsburg <malsburg@posteo.de>
;; URL: https://github.com/tmalsburg/tango-plus-theme
;; Package-Version: 20140425.1511
;; Version: 1.0.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This theme is based on the tango theme that is part of GNU Emacs.
;;
;; Most colors in this theme come from the Tango palette, which is in
;; the public domain: http://tango.freedesktop.org/
;; Some colors were added to improve contrast.
;;
;; For details and screenshots visit the project page on Github:
;;
;;     https://github.com/tmalsburg/tango-plus-theme
;;
;; To use this theme put the following in your startup file:
;;
;;     (load-theme 'vinurs-love t)
;;

;;; Install:

;; Put this file on your Emacs-Lisp load path and add the following in
;; your Emacs startup file:
;;
;;     (load-theme 'vinurs-love t)

;;; Code:

(defun true-color-p ()
  (or
	(display-graphic-p)
	(= (tty-display-color-cells) 16777216)))


(deftheme vinurs-love
  "Face colors using the Tango palette (light background).
Basic, Font Lock, Isearch, Gnus, Message, Ediff, Flyspell,
Semantic, and Ansi-Color faces are included.")

(let ((class '((class color) (min-colors 89)))
	   ;; vinurs palette colors.
	   ;;                              GUI       TER  
	   ;; generic
	   (butter-1 (if (true-color-p) "#fce94f" "#fce94f"))
	   (yellow   (if (true-color-p) "#b1951d" "#b1951d"))
	   (war      (if (true-color-p) "#dc752f" "#dc752f"))
	   (comp     (if (true-color-p) "#6c4173" "#6c4173"))
	   ;; One of mode-line's active colors. 
	   (act1     (if (true-color-p) "#d3d3e7" "#d3d3e7"))
	   ;; The other active color of mode-line.
	   (act2     (if (true-color-p) "#d3d3e7" "#d3d3e7"))
	   ;; The basic color of normal text.
	   (base     (if (true-color-p) "#d3d3e7" "#d3d3e7"))
	   ;; A dimmer version of the normal text color.
	   (base-dim (if (true-color-p) "#d3d3e7" "#d3d3e7"))
	   (err      (if (true-color-p) "#e0211d" "#e0211d"))
	   (butter-2 "#edd400") 
	   (butter-3 "#c4a000")
	   (orange-1 "#fcaf3e") (orange-2 "#f57900") (orange-3 "#ce5c00")
	   (choc-1 "#e9b96e") (choc-2 "#c17d11") (choc-3 "#8f5902")
	   (cham-1 "#8ae234") (cham-2 "#73d216") (cham-3 "#4e9a06")
	   (blue-1 "#729fcf") (blue-2 "#3465a4") (blue-3 "#204a87")
	   (plum-1 "#ad7fa8") (plum-2 "#75507b") (plum-3 "#5c3566")
	   (red-1 "#ef2929")  (red-2 "#cc0000")  (red-3 "#a40000")
	   (alum-1 "#eeeeec") (alum-2 "#d3d7cf") (alum-3 "#babdb6")
	   (alum-4 "#888a85") (alum-5 "#5f615c") (alum-6 "#2e3436")
	   ;; Not in vinurs palette; used for better contrast.
	   (white "#ffffff") (black "#000000") (plum-0 "#edc4e2")
	   (red-0 "#ffe6e6") (cham-0 "#e6ffc2") (cham-4 "#346604")
	   (blue-0 "#8cc4ff") (orange-4 "#b35000")
	   (default-bg-color "white")
	   (default-fg-color "black"))

  (custom-theme-set-faces
	`vinurs-love
	`(default                        ((,class (:foreground ,default-fg-color :background ,default-bg-color))))
	;; 光标
	`(cursor                         ((t (:background ,"red")))) 
	;;;;; hl-line-mode高亮当前行
	`(hl-line-face ((,class (:background "light blue" :bold t))
					 (t :weight bold)))
	`(hl-line ((,class (:background ,"light blue" :bold t)) ; old emacsen
				(t :weight bold)))
	;; 行号
	`(linum ((,class (:background ,default-bg-color :foreground ,default-fg-color))))

	;; auto-complete,自动补全
	'(company-scrollbar-bg ((t (:background "aquamarine2"))))
	'(company-scrollbar-fg ((t (:background "dark cyan"))))
	'(company-tooltip ((t (:background "light blue" :foreground "black"))))
	'(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
	'(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
	'(company-tooltip-selection ((t (:background "purple3"))))
	'(sp-pair-overlay-face ((t (:background "azure"))))

	;; `(ac-completion-face ((,class (:background ,"red" :foreground ,"green"))))
	;; `(ac-candidate-face ((,class (:inherit nil :background "light green"))))
	;; `(ac-gtags-selection-face ((,class (:inherit ac-selection-face :background "dark cyan"))))
	;; `(company-tooltip-common ((,class (:inherit company-tooltip :weight bold :underline nil))))
	;; `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection :weight bold :underline nil))))

	;; 缩进提示线
	`(indent-guide-face ((,class (:foreground ,"red"))))
	;; 原来的缩进提示线的颜色
	;;`(indent-guide-face ((,class (:foreground ,"#535353"))))

	;; Highlighting faces
	`(fringe                         ((,class (:foreground ,alum-2 :background ,white))))
	`(highlight                      ((,class (:background ,alum-1))))
	`(sentence-highlight-face        ((,class (:background ,alum-1))))
	;; 括号匹配的时候，配对的括号里面的字体
	`(show-paren-match               ((,class (:background ,alum-1 :weight bold :background "cyan"))))

	`(region                         ((,class (:background ,butter-1))))
	`(secondary-selection            ((,class (:background ,blue-0))))
	;; C-s的时候显示的颜色
	`(isearch                        ((,class (:foreground ,"black" :background ,"red"))))
	;;    `(lazy-highlight                 ((,class (:background ,cham-0))))
	;;    `(evil-ex-substitute-matches     ((,class (:background ,red-0 :strike-through ,red-1))))
	;;    `(evil-ex-substitute-replacement ((,class (:background ,cham-0))))
	;;    ;; 这个暂时是一个绕过去的方式，因为这个颜色我暂时去不掉，所以这个跟背景色一样
	;; ;;;;; whitespace-mode
	;;    `(whitespace-empty ((,class (:background nil :foreground ,yellow))))
	;;    `(whitespace-indentation ((,class (:background nil :foreground ,war))))
	;;    `(whitespace-line ((,class (:background nil :foreground ,comp))))
	;;    `(whitespace-newline ((,class (:background ,default-bg-color :foreground ,comp))))
	;;    `(whitespace-space ((,class (:background nil :foreground ,act2))))
	;;    `(whitespace-space-after-tab ((,class (:background nil :foreground ,yellow))))
	;;    `(whitespace-space-before-tab ((,class (:background nil :foreground ,yellow))))
	;;    `(whitespace-tab ((,class (:background nil))))
	;;    `(whitespace-trailing ((,class (:background ,"red" :foreground ,war))))
	;;    `(trailing-whitespace            ((,class (:background ,default-bg-color))))

	;; Mode line faces,状态栏
	;;      `(mode-line                      ((,class (:background ,blue-1 :foreground ,alum-1))))
	;; `(mode-line                      ((,class (:background ,blue-1 :foreground "red"))))

	;; `(powerline-active1                      ((,class (:background "green" :foreground "red"))))
	;; `(powerline-active2                      ((,class (:background "blue" :foreground "red"))))
	;;    `(mode-line-inactive             ((,class (:background ,alum-1 :foreground ,alum-3))))
	;;    ;; Window border face
	;;    `(vertical-border                ((,class (:foreground ,alum-3))))
	;;    ;; Escape and prompt faces
	;;    `(minibuffer-prompt              ((,class (:weight bold :foreground ,blue-3))))
	;;    `(escape-glyph                   ((,class (:foreground ,red-3))))
	;;    `(error                          ((,class (:foreground ,red-3))))
	;;    `(warning                        ((,class (:foreground ,orange-3))))
	;;    `(success                        ((,class (:foreground ,cham-3))))
	;;    ;; Font lock faces
	;;    `(font-lock-builtin-face         ((,class (:foreground ,plum-2))))

	;; 注释相关的设置，注释背景是白色，前面是灰色
	`(font-lock-comment-face         ((,class (:slant italic :foreground "gray70" :background "gray96"))))

	;; doxygen模式的注释
	`(font-lock-doc-face         ((,class (:slant italic :foreground "#2aa1ae" ))))

	`(font-lock-constant-face        ((,class (:weight light :foreground ,blue-3))))
	`(font-lock-function-name-face   ((,class (:foreground ,red-3))))
	`(font-lock-keyword-face         ((,class (:foreground ,blue-3 :weight light))))
	`(font-lock-string-face          ((,class (:foreground ,choc-3 :slant italic))))
	`(font-lock-type-face            ((,class (:foreground ,blue-3))))
	`(font-lock-variable-name-face   ((,class (:foreground ,red-3))))
	;; Button and link faces
	`(link                           ((,class (:underline t :foreground ,blue-3))))
	`(link-visited                   ((,class (:underline t :foreground ,blue-2))))
	;; headerae
	;;
	;; header line,开启semantic模式以后，在头部会显示函数名称，原来的太丑了，所以这里换一下 
	`(header-line                    ((,class (:underline t :foreground "gray40" :inverse-video t))))


	;;    ;; Gnus faces
	;;    `(gnus-group-news-1              ((,class (:weight bold :foreground ,plum-3))))
	;;    `(gnus-group-news-1-low          ((,class (:foreground ,plum-3))))
	;;    `(gnus-group-news-2              ((,class (:weight bold :foreground ,blue-3))))
	;;    `(gnus-group-news-2-low          ((,class (:foreground ,blue-3))))
	;;    `(gnus-group-news-3              ((,class (:weight bold :foreground ,red-3))))
	;;    `(gnus-group-news-3-low          ((,class (:foreground ,red-3))))
	;;    `(gnus-group-news-4              ((,class (:weight bold :foreground ,"#7a4c02"))))
	;;    `(gnus-group-news-4-low          ((,class (:foreground ,"#7a4c02"))))
	;;    `(gnus-group-news-5              ((,class (:weight bold :foreground ,orange-3))))
	;;    `(gnus-group-news-5-low          ((,class (:foreground ,orange-3))))
	;;    `(gnus-group-news-low            ((,class (:foreground ,alum-4))))
	;;    `(gnus-group-mail-1              ((,class (:weight bold :foreground ,plum-3))))
	;;    `(gnus-group-mail-1-low          ((,class (:foreground ,plum-3))))
	;;    `(gnus-group-mail-2              ((,class (:weight bold :foreground ,blue-3))))
	;;    `(gnus-group-mail-2-low          ((,class (:foreground ,blue-3))))
	;;    `(gnus-group-mail-3              ((,class (:weight bold :foreground ,cham-3))))
	;;    `(gnus-group-mail-3-low          ((,class (:foreground ,cham-3))))
	;;    `(gnus-group-mail-low            ((,class (:foreground ,alum-4))))
	;;    `(gnus-header-content            ((,class (:foreground ,cham-3))))
	;;    `(gnus-header-from               ((,class (:weight bold :foreground ,butter-3))))
	;;    `(gnus-header-subject            ((,class (:foreground ,red-3))))
	;;    `(gnus-header-name               ((,class (:foreground ,blue-3))))
	;;    `(gnus-header-newsgroups         ((,class (:foreground ,alum-4))))
	;;    ;; Message faces
	;;    `(message-header-name            ((,class (:foreground ,blue-3))))
	;;    `(message-header-cc              ((,class (:foreground ,butter-3))))
	;;    `(message-header-othe            ((,class (:foreground ,choc-2))))
	;;    `(message-header-subj            ((,class (:foreground ,red-3))))
	;;    `(message-header-to              ((,class (:weight bold :foreground ,butter-3))))
	;;    `(message-cited-text             ((,class (:slant italic :foreground ,alum-5))))
	;;    `(message-separator              ((,class (:weight bold :foreground ,cham-3))))
	;;    ;; SMerge
	;;    `(smerge-refined-change          ((,class (:background ,plum-1))))
	;;    ;; Ediff
	;;    `(ediff-current-diff-A           ((,class (:foreground ,black :background ,red-0))))
	;;    `(ediff-fine-diff-A              ((,class (:foreground ,black :background ,red-1))))
	;;    `(ediff-current-diff-B           ((,class (:foreground ,black :background ,cham-0))))
	;;    `(ediff-fine-diff-B              ((,class (:foreground ,black :background ,cham-1))))
	;;    `(ediff-even-diff-A              ((,class (:foreground ,black :background ,alum-1))))
	;;    `(ediff-even-diff-B              ((,class (:foreground ,black :background ,alum-1))))
	;;    `(ediff-odd-diff-A               ((,class (:foreground ,black :background ,alum-1))))
	;;    `(ediff-odd-diff-B               ((,class (:foreground ,black :background ,alum-1))))
	;;    ;; Flyspell
	;;    `(flyspell-duplicate             ((,class (:underline ,orange-1))))
	;;    `(flyspell-incorrect             ((,class (:underline ,red-1 :background ,red-0))))
	;;    ;; Org mode
	;;    `(org-level-1                    ((,class (:foreground ,blue-3 :weight bold))))
	;;    `(org-level-2                    ((,class (:foreground ,blue-3))))
	;;    `(org-level-3                    ((,class (:foreground ,blue-3))))
	;;    `(org-level-4                    ((,class (:foreground ,blue-3))))
	;;    `(org-level-5                    ((,class (:foreground ,blue-3))))
	;;    `(org-level-6                    ((,class (:foreground ,blue-3))))
	;;    `(org-level-7                    ((,class (:foreground ,blue-3))))
	;;    `(org-level-8                    ((,class (:foreground ,blue-3))))
	;;    `(org-todo                       ((,class (:foreground ,red-2 :weight bold))))
	;;    `(org-done                       ((,class (:foreground ,cham-3))))
	;;    `(org-table                      ((,class (:foreground ,blue-3))))
	;;    `(org-date                       ((,class (:foreground ,plum-1))))
	;;    `(org-footnote                   ((,class (:foreground ,alum-5))))
	;;    `(org-hide                       ((,class (:foreground ,alum-1))))
	;;    ;; Mu4e
	;;    `(mu4e-flagged-face              ((,class (:foreground ,red-3 :weight bold))))
	;;    `(mu4e-unread-face               ((,class (:foreground ,blue-3 :weight bold))))
	;;    `(mu4e-replied-face              ((,class (:foreground ,alum-4))))
	;;    `(mu4e-header-highlight-face     ((,class (:background ,alum-1))))
	`(window-numbering-face ((t (:background ,"red" :weight bold))) t)

	;; Helm
	;; helm对话框里面当前行的颜色
	`(helm-selection                 ((,class (:background ,"cyan"))))
	;; helm搜索的单词颜色 
	`(helm-swoop-target-word-face    ((,class (:background ,"red"))))
	;;    ;;`(helm-swoop-target-word-face    ((,class (:background ,cham-1))))
	`(helm-swoop-target-word-face    ((,class (:background ,"red"))))
	;;    `(helm-swoop-target-line-face    ((,class (:background ,alum-1))))
	;;    `(helm-swoop-target-line-block-face ((,class (:background ,alum-1))))

	;; 用helm-swoop的时候出来的第一行的颜色设置,也就是显示当前的文件名的那一行
	`(helm-source-header             ((,class (:background ,butter-2 :foreground ,alum-5
												:weight bold :height 1.3
												:family "Sans Serif"))))
	`(helm-buffer-directory ((t (:background "orchid4" :foreground "#b2b2b2"))))
	`(helm-buffer-file ((t (:background "gray100" :foreground "dark magenta"))))
	`(helm-buffer-process ((t (:background "gray100" :foreground "dark blue"))))
	`(helm-buffer-size ((t (:background "gray100" :foreground "red3"))))

	`(helm-ff-file ((t (:background "light green" :foreground "#b2b2b2" :weight normal))))
	;;    ;;`(helm-selection                 ((,class (:background ,alum-1))))
	;;    `(helm-action                    ((,class (:background ,"red"))))
	;;    ;;   `(helm-candidate-number          ((,class (:background ,alum-5
	;;    `(helm-candidate-number          ((,class (:background ,"red"
	;; 														  :foreground ,"black"))))
	;;    ;;   :foreground ,butter-1))))

	;;    ;; Markdown mode
	;;    `(markdown-italic-face           ((,class (:slant italic))))
	;;    `(markdown-bold-face             ((,class (:weight bold))))
	;;    `(markdown-header-rule-face      ((,class (:foreground ,blue-3 :weight bold))))
	;;    `(markdown-header-delimiter-face ((,class (:foreground ,blue-3))))
	;;    `(markdown-header-face           ((,class (:foreground ,blue-3))))
	;;    `(markdown-header-face-1         ((,class (:inherit markdown-header-face
	;; 													   :weight bold))))
	;;    `(markdown-header-face           ((,class (:foreground ,blue-3))))
	;;    `(markdown-inline-code-face      ((,class (:foreground ,choc-3))))
	;;    `(markdown-list-face             ((,class (:weight bold))))
	;;    `(markdown-blockquote-face       ((,class (:foreground ,choc-3 :slant italic))))
	;;    `(markdown-pre-face              ((,class (:foreground ,choc-3))))
	;;    `(markdown-language-keyword-face ((,class (:foreground ,blue-3))))
	;;    `(markdown-link-face             ((,class (:foreground ,blue-3))))
	;;    `(markdown-missing-link-face     ((,class (:foreground ,blue-3))))
	;;    `(markdown-reference-face        ((,class (:foreground ,blue-3))))
	;;    `(markdown-footnote-face         ((,class (:foreground ,blue-3))))
	;;    `(markdown-url-face              ((,class (:foreground ,blue-3))))
	;;    `(markdown-link-title-face       ((,class (:foreground ,blue-3))))
	;;    `(markdown-link-break-face       ((,class (:foreground ,blue-3))))
	;;    `(markdown-comment-face          ((,class (:foreground ,alum-4))))
	;;    `(markdown-math-face             ((,class (:foreground ,blue-3))))
	;;    ;; Semantic faces
	;;    `(semantic-decoration-on-includes
	;; 	 ((,class (:underline  ,cham-4))))
	;;    `(semantic-decoration-on-private-members-face
	;; 	 ((,class (:background ,alum-2))))
	;;    `(semantic-decoration-on-protected-members-face
	;; 	 ((,class (:background ,alum-2))))
	;;    `(semantic-decoration-on-unknown-includes
	;; 	 ((,class (:background ,choc-3))))
	;;    `(semantic-decoration-on-unparsed-includes
	;; 	 ((,class (:underline  ,orange-3))))
	;;    `(semantic-tag-boundary-face
	;; 	 ((,class (:overline   ,blue-1))))
	;;    `(semantic-unmatched-syntax-face
	;; 	 ((,class (:underline  ,red-1))))

	;; avy goto line配置
	;; 默认的时候的颜色
	`(avy-lead-face ((t (:background "light green" :foreground "#a31db1"))))
	;; 匹配了第一个字符以后的颜色
	`(avy-lead-face-0 ((t (:background "light green" :foreground "#4f97d7"))))
	`(avy-lead-face-1 ((t (:background "#293239" :foreground "#a31db1"))))
	`(avy-lead-face-2 ((t (:background "#293239" :foreground "#4f97d7"))))

	;; magit
	`(magit-branch-current ((t (:inherit bold
								 :background "dark cyan"
								 :foreground "#4f97d7"
								 :box 1))))
	`(magit-section-highlight ((t (:background "light blue"))))
	) 

  (custom-theme-set-variables
	'vinurs-love
	`(ansi-color-names-vector [,alum-6 ,red-3 ,cham-3 ,butter-3
								,blue-3 ,plum-3 ,blue-1 ,alum-1]))
  ) 

(provide-theme 'vinurs-love)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; vinurs-love-theme.el ends here
