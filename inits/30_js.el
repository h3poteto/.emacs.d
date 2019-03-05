(use-package js2-mode
  :mode
  ("\\.js.erb$" . js2-mode)
  ("\\.js$" . js2-mode)
  :config
  ;; js-indent
  (setq js-indent-level 2)
  ;; method-chain indent
  (advice-add 'js--multi-line-declaration-indentation :around (lambda (orig-fun &rest args) nil))
  (setq indent-tabs-mode nil)
  (setq my-js-mode-indent-num 2)
  (setq js2-basic-offset my-js-mode-indent-num)
  (setq js-switch-indent-offset my-js-mode-indent-num)
  (setq js2-include-browser-externs nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-highlight-external-variables nil)
  (setq js2-include-jslint-globals nil)
  :hook
  (js2-mode . smartparens-mode)
  (js2-mode . prettier-js-mode)
  (js2-mode . (lambda ()
                (hs-minor-mode 1)))
  )
