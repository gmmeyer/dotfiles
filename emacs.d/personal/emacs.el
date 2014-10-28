;; I like using the mouse in emacs
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))


;; yay! I can scroll with my mouse wheel!
(defun up-slightly ()
  "Up slightly"
  (interactive)
  (scroll-up 1))

(defun
  down-slightly ()
  "Down slightly"
  (interactive)
  (scroll-down 1))

;; tmux integration
(require 'emamux)

;; this will help with the pain of writing python
;; nevermind
;; (global-aggressive-indent-mode)

(global-set-key (kbd "<mouse-4>") 'down-slightly)
(global-set-key (kbd "<mouse-5>") 'up-slightly)

(disable-theme 'zenburn)
;(load-theme 'tomorrow-night-paradise t)
;(load-theme 'railscasts t)

(load-theme 'monokai t)

(global-hl-line-mode 1)

;;tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)
(setq-default sh-basic-offset 2)
(setq-default js2-basic-offset 2)
(setq-default python-indent 2)
(setq-default python-indent-offset 2)

;;(setq tab-width 2)
;;(defvaralias 'js-indent-level 'tab-width)
;;(defvaralias 'c-basic-offset 'tab-width)
;;(defvaralias 'cperl-indent-level 'tab-width)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))


(provide 'emacs.el)
