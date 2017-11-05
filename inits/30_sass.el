;; sass-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))

;; flycheck
(add-hook 'sass-mode-hook 'flycheck-mode)

