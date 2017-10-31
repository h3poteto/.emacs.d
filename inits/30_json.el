;; json
(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(require 'flymake-json)
(add-hook 'json-mode-hook 'flymake-json-load)
