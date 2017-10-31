;; php-mode
(require 'php-mode)

(setq php-mode-force-pear t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode ))

;; flycheck
(add-hook 'php-mode-hook 'flycheck-mode)
