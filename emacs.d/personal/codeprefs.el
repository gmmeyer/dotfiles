;;; codeprefs --- Summary0;95;0c

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

(provide 'codeprefs)
;;; codeprefs.el ends here
