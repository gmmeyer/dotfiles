;;;This one is pretty self explanitory

;;tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default css-indent-offset 4)
(setq-default sh-basic-offset 4)
(setq-default js2-basic-offset 4)

;;(setq tab-width 2)
;;(defvaralias 'js-indent-level 'tab-width)
;;(defvaralias 'c-basic-offset 'tab-width)
;;(defvaralias 'cperl-indent-level 'tab-width)

(setq-default python-indent 4)
(setq-default python-indent-offset 4)

(setq-default web-mode-markup-indent-offset 2)
(setq-default web-mode-css-indent-offset 2)
(setq-default web-mode-code-indent-offset 2)
(setq-default lua-indent-level 2)

(setq cssm-indent-level 2)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function 'cssm-c-style-indenter)
(setq cssm-mirror-mode nil)

(provide 'indents.el)
