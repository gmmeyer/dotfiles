;;;Set up the appearance of emacs

;; powerline > mode line
(require 'powerline)

(disable-theme 'zenburn)
(require 'moe-theme)

(moe-dark)
(powerline-moe-theme)

(moe-theme-set-color 'w/b)

;;(global-hl-line-mode 0)

(menu-bar-mode -1)

(provide 'appearance.el)
