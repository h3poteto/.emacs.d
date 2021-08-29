(use-package vue-mode
  :if (eq (ignore-minor-mode 'ignore-vue-mode) nil)
  :after
  flycheck
  :config
  (setq css-indent-offset 2)
  (setq js-switch-indent-offset 2)
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)
  (setq mmm-submode-decoration-level 0)
  ;; https://github.com/AdamNiederer/vue-mode/issues/74#issuecomment-528560608
  (setq mmm-js-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))
  (setq mmm-typescript-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))
  (flycheck-add-mode 'javascript-eslint 'vue-mode)
  (flycheck-add-mode 'javascript-eslint 'vue-html-mode)
  (flycheck-add-mode 'javascript-eslint 'css-mode)
  :hook
  (vue-mode . flycheck-mode)
  (vue-mode . prettier-js-mode)
  (vue-mode . lsp-deferred)
  )
