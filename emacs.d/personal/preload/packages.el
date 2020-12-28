;;; packages --- my packages

;;; Commentary: my packages

(require 'package)

;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("org" . "http://orgmode.org/elpa/")))

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(emamux auto-complete
                             caml clojure-mode company company-anaconda
                             company-go ctags-update
                             emamux
                             moe-theme multi-web-mode markdown-mode
                             f fzf
                             go-autocomplete go-eldoc go-mode go-projectile
                             gotest
                             ;;handlebars-mode
                             json-reformat
                             less-css-mode
                             magit markdown-mode minitest moe-theme multi-term
                             org
                             ;; pastels-on-dark-theme 
                             paradox pkg-info pony-mode
                             powerline pyenv-mode pyenv-mode-auto
                             rspec-mode 
                             ;; ruby-block
                             rbenv
                             smart-mode-line
                             textmate tuareg
                             virtualenv
                             websocket web-mode with-editor
                             zenburn-theme))

(defun install-packages ()
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(install-packages)

(require 'paradox)

(paradox-enable)

(provide 'packages.el)
