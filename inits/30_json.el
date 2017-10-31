;; json
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(add-hook 'json-mode-hook 'flymake-json-load)
