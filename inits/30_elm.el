(use-package elm-mode-hook
  :if (eq (ignore-minor-mode 'ignore-elm-mode) nil)
  :hook
  (elm-mode . elm-format-on-save-mode)
  (elm-mode . lsp)
  )
