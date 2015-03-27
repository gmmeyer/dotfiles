;;;Set up the appearance of emacs

;; powerline > mode line
;;(require 'powerline)
;;(powerline-default-theme)

(disable-theme 'zenburn)
(require 'moe-theme)

(moe-dark)

(moe-theme-set-color 'w/b)

;;(powerline-moe-theme)

(global-hl-line-mode 0)

(menu-bar-mode -1)
;;(load-theme 'railscasts)

(provide 'appearance.el)
