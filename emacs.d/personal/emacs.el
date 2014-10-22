; I like using the mouse in emacs
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

(global-hl-line-mode 0)

;tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)
(setq-default sh-basic-offset 2)
(setq-default js2-basic-offset 2)

;(setq tab-width 2)
;(defvaralias 'js-indent-level 'tab-width)
;(defvaralias 'c-basic-offset 'tab-width)
;(defvaralias 'cperl-indent-level 'tab-width)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))


(provide 'emacs.el)
