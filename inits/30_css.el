;; css mode hook
(add-hook 'css-mode-hook
          (lambda ()
            (setq css-indent-offset 2)
            ))

;; flycheck
(add-hook 'css-mode-hook 'flycheck-mode)
