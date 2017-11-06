;; js-indent
(setq js-indent-level 2)


;; js2-mode
;;(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js.erb$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq my-js-mode-indent-num 2)
            (setq js2-basic-offset my-js-mode-indent-num)
            (setq js-switch-indent-offset my-js-mode-indent-num)
            ))

;; flycheck
(add-hook 'js2-mode-hook 'flycheck-mode)
;; smartparens
(add-hook 'js2-mode-hook #'smartparens-mode)

(setq js2-include-browser-externs nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-highlight-external-variables nil)
(setq js2-include-jslint-globals nil)
