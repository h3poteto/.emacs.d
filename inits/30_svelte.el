(use-package svelte-mode
  :if (eq (ignore-minor-mode 'ignore-svelte-mode) nil)
  :hook
  (svelte-mode . prettier-js-mode)
  (svelte-mode . lsp-deferred)
  )
