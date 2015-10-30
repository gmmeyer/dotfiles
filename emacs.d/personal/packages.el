;;; packages --- my packages

;;; Commentary: my packages

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(emamux auto-complete less-css-mode moe-theme
                             multi-web-mode markdown-mode textmate web-mode
                             go-mode go-autocomplete go-eldoc
                             go-projectile gotest
                             fzf
                             ;;handlebars-mode
                             magit clojure-mode
                             pastels-on-dark-theme websocket pony-mode
                             org go-mode powerline minitest rspec-mode
                             ruby-block
                             ctags-update go-autocomplete virtualenv))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages.el)
