;; sass-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
(add-hook 'sass-mode-hook 'rainbow-mode)

(add-hook 'sass-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
