;;;Set up the appearance of emacs


;;(powerline-default-theme)

(disable-theme 'zenburn)

(menu-bar-mode -1)

(setq-default visible-cursor nil)
(blink-cursor-mode (- (*) (*) (*)))

(show-paren-mode t)

(global-hl-line-mode 0)

;; moe theme stuff

;; powerline > mode line
;; (require 'powerline)

(require 'moe-theme)

(setq moe-theme-highlight-buffer-id t)

;; (powerline-moe-theme)

;; markdown title resizing
(setq moe-theme-resize-markdown-title '(2.0 1.7 1.5 1.3 1.0 1.0))
(setq moe-theme-resize-org-title '(2.2 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(2.0 1.7 1.5 1.3 1.1 1.0))

(setq show-paren-style 'expression)

(moe-theme-set-color 'w/b)

(moe-dark)

;;(load-theme 'railscasts)

(provide 'appearance.el)
