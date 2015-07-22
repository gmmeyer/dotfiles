;;;Set up the appearance of emacs

;; powerline > mode line
;;(require 'powerline)
;;(powerline-default-theme)

(disable-theme 'zenburn)
(require 'moe-theme)

(moe-dark)

(setq-default visible-cursor nil)

(blink-cursor-mode (- (*) (*) (*)))

(moe-theme-set-color 'w/b)

(require 'powerline)
(powerline-moe-theme)

(global-hl-line-mode 0)

(show-paren-mode t)
(setq show-paren-style 'expression)

(menu-bar-mode -1)
;;(load-theme 'railscasts)

(provide 'appearance.el)
