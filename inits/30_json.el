;; json
(use-package json-mode
  :mode
  ("\\.json$" . json-mode)
  ("\\.json.tpl$" . json-mode)
  :hook
  (json-mode . flymake-json-load)
  )
