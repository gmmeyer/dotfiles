; I like using the mouse in emacs
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

; sets the load path correctly
(setq load-path (cons "~/.emacs.d/" load-path))

; load themes
(add-to-list 'custom-theme-load-path "~/.emacs-lisp/themes/")

; load the railscast theme
; (load-file "~/.emacs-lisp/themes/railscasts-theme.el")
; (load-theme 'railscasts t)

; load themes
(defun monokai-init ()
  (load-theme 'monokai t)
)

(defun warm-night-init ()
  (load-theme 'warm-night t)
)

(add-hook 'after-init-hook 'warm-night-init)

; set up the package manager
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" "9e7e1bd71ca102fcfc2646520bb2f25203544e7cc464a30c1cbd1385c65898f4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ()))
