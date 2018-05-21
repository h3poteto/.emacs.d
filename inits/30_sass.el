;; sass-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
(add-hook 'sass-mode-hook 'rainbow-mode)


