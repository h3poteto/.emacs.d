;; flycheck
(use-package flycheck-color-mode-line
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
  ;; eslintをやりたいのでjshintを無効化する
  (setq flycheck-disabled-checkers '(javascirpt-jshint))
  (setq flycheck-checkers '(javascript-eslint)))
