;; flycheck
(require 'flycheck-color-mode-line)

;; eslintがしたいのでjshintを無効化する
(eval-after-load "flycheck"
  '(progn
     (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
     (setq flycheck-disabled-checkers '(javascirpt-jshint))
     (setq flycheck-checkers '(javascript-eslint))))

