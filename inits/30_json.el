;; json
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.json.tpl$" . json-mode))
;; smartparens
(add-hook 'json-mode-hook #'smartparens-mode)
(add-hook 'json-mode-hook 'flymake-json-load)
