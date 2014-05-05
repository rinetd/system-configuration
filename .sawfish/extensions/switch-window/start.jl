
(require 'sawfish.wm.state.maximize)
(require 'sawfish.wm.util.stacking)
(require 'sawfish.wm.commands)
(require 'Animate-move)


(defun frame-width-fix ()
  (let ((win (input-focus)))
    (- (car (window-frame-dimensions win)) (car (window-dimensions win)))))

(defun frame-height-fix ()
  (let ((win (input-focus)))
    (- (cdr (window-frame-dimensions win)) (cdr (window-dimensions win)))))

;;-----------------------------------------------------------------------------
(defvar cp-panel-height 20)
(defvar cp-frame-width-fix 2)
(defvar cp-frame-height-fix 20)


(define (set-title)
  `(((class . title)
     (background . ,htc-border-color)
     (width . 0)
     (height . 0)
     (top-edge . 0))))


(define (set-top-border)
  `(((class . top-border)
     (background . ,htc-border-color)
     (height . ,htc-border-width)
     (left-edge . 0)
     (right-edge . 0)
     (top-edge . ,htc-border-edge))))


(define (set-bottom-border)
  `(((class . bottom-border)
     (background . ,htc-border-color)
     (height . ,htc-border-width)
     (left-edge . 0)
     (right-edge . 0)
     (bottom-edge . ,htc-border-edge))))


(define (set-left-border)
  `(((class . left-border)
     (background . ,htc-border-color)
     (width . ,htc-border-width)
     (left-edge . ,htc-border-edge)
     (top-edge . 0)
     (bottom-edge . 0))))


(define (set-right-border)
  `(((class . right-border)
     (background . ,htc-border-color)
     (width . ,htc-border-width)
     (right-edge . ,htc-border-edge)
     (top-edge . 0)
     (bottom-edge . 0))))


(define (set-bottom-left-border)
  `(((class . bottom-left-corner)
     (background . ,htc-border-color)
     (width . ,htc-border-width)
     (height . ,htc-border-width)
     (left-edge . ,htc-border-edge)
     (bottom-edge . ,htc-border-edge))))


(define (set-bottom-right-border)
  `(((class . bottom-right-corner)
     (background . ,htc-border-color)
     (width . ,htc-border-width)
     (height . ,htc-border-width)
     (right-edge . ,htc-border-edge)
     (bottom-edge . ,htc-border-edge))))


(define (set-top-left-border)
  `(((class . top-left-corner)
     (background . ,htc-border-color)
     (width . ,htc-border-width)
     (height . ,htc-border-width)
     (left-edge . ,htc-border-edge)
     (top-edge . ,htc-border-edge))))


(define (set-top-right-border)
  `(((class . top-right-corner)
     (background . ,htc-border-color)
     (width . ,htc-border-width)
     (height . ,htc-border-width)
     (right-edge . ,htc-border-edge)
     (top-edge . ,htc-border-edge))))


(defun htc-out (tmp)
  (display-message (prin1-to-string tmp)))


(defun htc-focus-border ()
  (let ((win (workspace-windows current-workspace)))
    (htc-set-workspace-focus (input-focus))
    (while win
      (if (= (car win) (input-focus))
          (setq htc-border-color (get-color htc-focus-color))
        (setq htc-border-color (get-color htc-non-focus-color)))
      (set-window-frame (car win) (append
                                   (set-title)
                                   (set-top-border)
                                   (set-bottom-border)
                                   (set-left-border)
                                   (set-right-border)
                                   (set-top-left-border)
                                   (set-top-right-border)
                                   (set-bottom-left-border)
                                   (set-bottom-right-border)))
      (setq win (cdr win)))))


(defun cp-save-origin-geometry (w)
  (let ((pos (window-position w))
        (dim (window-dimensions w)))
    (when (eq nil (window-get w 'origin-geometry))
      (window-put w 'origin-geometry (list (car pos) (cdr pos)
                                           (car dim) (cdr dim))))))


(defun cp-move-resize (w x y width height)
  (cp-save-origin-geometry w)
  (resize-window-to w
                    width
                    height)
  ;;  (move-window-to w
  (animate-move-window-to w
                          (round x)
                          (round y)))


(defun cp-move-left (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  0
                  cp-panel-height
                  (- (/ (screen-width) 2) cp-frame-width-fix)
                  (- (screen-height) cp-panel-height cp-frame-height-fix)))


(defun cp-move-right (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  (/ (screen-width) 2)
                  cp-panel-height
                  (- (/ (screen-width) 2) cp-frame-width-fix)
                  (- (screen-height) cp-panel-height cp-frame-height-fix)))


(defun cp-move-top (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  0
                  cp-panel-height
                  (- (screen-width) cp-frame-width-fix)
                  (- (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)))


(defun cp-move-bottom (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  0
                  (+ (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)
                  (- (screen-width) cp-frame-width-fix)
                  (- (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)))


(defun cp-move-top-left (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  0
                  cp-panel-height
                  (- (/ (screen-width) 2) cp-frame-width-fix)
                  (- (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)))


(defun cp-move-top-right (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  (/ (screen-width) 2)
                  cp-panel-height
                  (- (/ (screen-width) 2) cp-frame-width-fix)
                  (- (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)))


(defun cp-move-bottom-left (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  0
                  (+ (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)
                  (- (/ (screen-width) 2) cp-frame-width-fix)
                  (- (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)))


(defun cp-move-bottom-right (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  (/ (screen-width) 2)
                  (+ (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)
                  (- (/ (screen-width) 2) cp-frame-width-fix)
                  (- (/ (- (screen-height) cp-panel-height) 2) cp-frame-height-fix)))


(defun cp-maximize (win)
  (set-window-type win 'unframed)
  (cp-move-resize win
                  0
                  0
                  (screen-width)
                  (- (screen-height) 0)))


(defun cp-move-center (win)
  (set-window-type win 'default)
  (cp-save-origin-geometry win)
  (let ((w (nth 2 (window-get win 'origin-geometry)))
        (h (nth 3 (window-get win 'origin-geometry))))
    (cp-move-resize win
                    (/ (- (screen-width)
                          (+ w cp-frame-width-fix)) 2)
                    (+ 
                     (/ (- (screen-height)
                           cp-panel-height
                           (+ h cp-frame-height-fix)) 2) cp-panel-height)
                    w
                    h)))


(defun cp-move-origin-geometry (win)
  (set-window-type win 'default)
  (cp-move-resize win
                  (nth 0 (window-get win 'origin-geometry))
                  (nth 1 (window-get win 'origin-geometry))
                  (nth 2 (window-get win 'origin-geometry))
                  (nth 3 (window-get win 'origin-geometry))))

