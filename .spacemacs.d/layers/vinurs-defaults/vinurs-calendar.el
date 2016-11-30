;;; vinurs-calendar.el --- 

;; Copyright 2016 haiyuan.zhang
;;
;; Author: haiyuan.vinurs@gmail.com
;; Version: $Id: @(#)vinurs-calendar.el,v 0.0 2016/10/21 05:56:31 vinurs Exp $
;; Changed: <vinurs 11/30/2016 06:59:28>
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
;;   (require 'vinurs-calendar)




;;; Code:

(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(require 'holidays-priv) 

;; (spacemacs/declare-prefix "oac" "calendar") 

;; 定义快捷键
(spacemacs/set-leader-keys "oac" 'cfw:open-calendar-buffer) 

;; First day of the week
(setq calendar-week-start-day 1) ; 0:Sunday, 1:Monday


(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
	:contents-sources
	(list
	  ;; (cfw:org-create-source "Green")  ; orgmode source
	  ;; (cfw:howm-create-source "Blue")  ; howm source
	  ;; (cfw:cal-create-source "Orange") ; diary source
	  ;; (cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
	  ;; (cfw:ical-create-source "gcal" "https://..../basic.ics" "IndianRed") ; google calendar ICS
	  )
	)) 


;; 中文月份 
(setq calendar-month-name-array
  ["一月" "二月" "三月"     "四月"   "五月"      "六月"
	"七月"    "八月"   "九月" "十月" "十一月" "十二月"]) 
;; 英文月份
;; (setq calendar-month-name-array
;;   ["January" "February" "March"     "April"   "May"      "June"
;; 	"July"    "August"   "September" "October" "November" "December"]) 


;; Week days
(setq calendar-day-name-array
  ["周日" "周一" "周二" "周三" "周四" "周五" "周六"]) 
;; 英文星期
;; (setq calendar-day-name-array
;;   ["Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"]) 


;; (require 'holidays) 
(setq holiday-vinurs-holidays
  '(
	 ;;公历节日
	 (holiday-fixed 1 1 "元旦")

	 (holiday-fixed 2 14 "情人节")
	 (holiday-fixed 3 8 "妇女节")
	 (holiday-fixed 3 14 "白色情人节")
	 (holiday-fixed 4 1 "愚人节")
	 (holiday-fixed 5 1 "劳动节")
	 (holiday-fixed 5 4 "青年节")
	 (holiday-float 5 0 2 "母亲节")
	 (holiday-fixed 6 1 "儿童节")
	 (holiday-float 6 0 3 "父亲节")
	 (holiday-fixed 9 10 "教师节")
	 (holiday-fixed 10 1 "国庆节")
	 (holiday-fixed 12 25 "圣诞节")

	 ;; 农历节日
	 (holiday-lunar 1 1 "春节" 0)
	 (holiday-lunar 1 2 "春节" 0)
	 (holiday-lunar 1 3 "春节" 0)
	 (holiday-lunar 1 15 "元宵节" 0)

	 (holiday-solar-term "清明" "清明节")
	 (holiday-solar-term "小寒" "小寒" )
	 (holiday-solar-term "大寒" "大寒" )
	 (holiday-solar-term "立春" "立春" )
	 (holiday-solar-term "雨水" "雨水" )
	 (holiday-solar-term "惊蛰" "惊蛰" )
	 (holiday-solar-term "春分" "春分" )
	 (holiday-solar-term "谷雨" "谷雨" )
	 (holiday-solar-term "立夏" "立夏" )
	 (holiday-solar-term "小满" "小满" )
	 (holiday-solar-term "芒种" "芒种" )
	 (holiday-solar-term "夏至" "夏至" )
	 (holiday-solar-term "小暑" "小暑" )
	 (holiday-solar-term "大暑" "大暑" )
	 (holiday-solar-term "立秋" "立秋" )
	 (holiday-solar-term "处暑" "处暑" )
	 (holiday-solar-term "白露" "白露" )
	 (holiday-solar-term "秋分" "秋分" )
	 (holiday-solar-term "寒露" "寒露" )
	 (holiday-solar-term "霜降" "霜降" )
	 (holiday-solar-term "立冬" "立冬" )
	 (holiday-solar-term "小雪" "小雪" )
	 (holiday-solar-term "大雪" "大雪" )
	 (holiday-solar-term "冬至" "冬至" )
	 (holiday-lunar 5 5 "端午节" 0)
	 (holiday-lunar 8 15 "中秋节" 0)
	 (holiday-lunar 7 7 "七夕情人节" 0)
	 (holiday-lunar 12 8 "腊八节" 0)
	 (holiday-lunar 9 9 "重阳节" 0)
	 (holiday-lunar 12 22 "冬至" 0)

	 )) 

(setq mark-holidays-in-calendar t) 
(setq christian-holidays nil) ;; 不显示基督教的节日
(setq hebrew-holidays nil)    ;; 不显示希伯来人的节日
(setq islamic-holidays nil)   ;; 不显示伊斯兰教的节日


(setq cal-china-x-important-holidays
  (append cal-china-x-chinese-holidays
	;; vinurs定义的一些节日
    holiday-vinurs-holidays

	;;vinurs-private-holidays 
	vinurs-private-holidays
	)
  ) 


(setq calendar-mark-holidays-flag t) 
;; (defvar displayed-month 1) 

(setq calendar-holidays cal-china-x-important-holidays) 
;; (setq calendar-holidays cal-china-x-chinese-holidays) 



;; 定义字体
;; (custom-set-faces
;;  '(cfw:face-title ((t (:foreground "#f0dfaf" :weight bold :height 2.0 :inherit variable-pitch))))
;;  '(cfw:face-header ((t (:foreground "#d0bf8f" :weight bold))))
;;  '(cfw:face-sunday ((t :foreground "#cc9393" :background "grey10" :weight bold)))
;;  '(cfw:face-saturday ((t :foreground "#8cd0d3" :background "grey10" :weight bold)))
;;  '(cfw:face-holiday ((t :background "grey10" :foreground "#8c5353" :weight bold)))
;;  '(cfw:face-grid ((t :foreground "DarkGrey")))
;;  '(cfw:face-default-content ((t :foreground "#bfebbf")))
;;  '(cfw:face-periods ((t :foreground "cyan")))
;;  '(cfw:face-day-title ((t :background "grey10")))
;;  '(cfw:face-default-day ((t :weight bold :inherit cfw:face-day-title)))
;;  '(cfw:face-annotation ((t :foreground "RosyBrown" :inherit cfw:face-day-title)))
;;  '(cfw:face-disable ((t :foreground "DarkGray" :inherit cfw:face-day-title)))
;;  '(cfw:face-today-title ((t :background "#7f9f7f" :weight bold)))
;;  '(cfw:face-today ((t :background: "grey10" :weight bold)))
;;  '(cfw:face-select ((t :background "#2f2f2f")))
;;  '(cfw:face-toolbar ((t :foreground "Steelblue4" :background "Steelblue4")))
;;  '(cfw:face-toolbar-button-off ((t :foreground "Gray10" :weight bold)))
;;  '(cfw:face-toolbar-button-on ((t :foreground "Gray50" :weight bold)))) 




;; 日历边框设置
;; Another unicode chars
(setq cfw:fchar-junction ?╬
  cfw:fchar-vertical-line ?║
  cfw:fchar-horizontal-line ?═
  cfw:fchar-left-junction ?╠
  cfw:fchar-right-junction ?╣
  cfw:fchar-top-junction ?╦
  cfw:fchar-top-left-corner ?╔
  cfw:fchar-top-right-corner ?╗) 



;; (spacemacs//set-monospaced-font   "Source Code Pro" "Hiragino Sans GB" 14 16) 
;; (spacemacs//set-monospaced-font   "Source Code Pro" "Hiragino Sans GB" 14 16) 


(provide 'vinurs-calendar)

;;; vinurs-calendar.el ends here
