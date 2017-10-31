;; sass-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
;; (require 'scss-mode)
;; (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))


;; flycheck
(add-hook 'scss-mode-hook 'flycheck-mode)
(add-hook 'sass-mode-hook 'flycheck-mode)
