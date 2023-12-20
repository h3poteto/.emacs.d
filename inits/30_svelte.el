(use-package svelte-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-svelte-mode) nil)
  :hook
  (svelte-mode . prettier-js-mode)
  (svelte-mode . lsp-deferred)
  )
