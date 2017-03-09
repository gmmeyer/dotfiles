;;; This is just my general config file.
;;; I am mostly going to put my config in this file,
;;; though I will also use some other breakout files.

;; I like using the mouse in emacs
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

(show-paren-mode t)
(setq show-paren-style 'expression)

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

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))

(setq prelude-flyspell nil)

(rbenv-use-corresponding)

;; do not clean whitespace on save
;; (setq prelude-clean-whitespace-on-save nil)

(global-set-key (kbd "<mouse-4>") 'down-slightly)
(global-set-key (kbd "<mouse-5>") 'up-slightly)

(async-bytecomp-package-mode 1)

(provide 'emacs.el)
