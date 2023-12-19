(use-package js2-mode
  :if (eq (ignore-minor-mode 'ignore-js-mode) nil)
  :mode
  ("\\.js.erb$" . js2-mode)
  ("\\.js$" . js2-mode)
  :config
  ;; js-indent
  (setq js-indent-level 2)
  ;; flycheck is better than flymake in lsp-mode, so disable flymake.
  (setq lsp-prefer-flymake nil)
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
  (js2-mode . prettier-js-mode)
  (js2-mode . (lambda ()
                (hs-minor-mode 1)))
  (js2-mode . lsp-deferred)
  (js2-mode . flycheck-mode)
  )
