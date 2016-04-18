;;; codeprefs --- Summary

;;; Commentary:

;;;Set code preferences

;;; Code:
(setq-default js2-strict-trailing-comma-warning nil)

(setq-default js2-strict-missing-semi-warning nil)

(setq-default js2-missing-semi-one-line-override t)

(setq-default js2-include-node-externs t)

(setq-default js2-include-browser-externs t)

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)
                        '(javascript-jscs))))

(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mako\\'" . web-mode))

(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(setq web-mode-engines-alist
      '(("ctemplate"    . "\\.hbs\\'")
        ("mako"    . "\\.mako\\'"))
      )

;; UTF-8 EVERYWHERE!!!
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(provide 'codeprefs)
;;; codeprefs.el ends here
