;; python
;; jedi
(setq jedi:setup-keys nil)
(setq jedi:tooltip-method nil)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq ac-sources
      (delete 'ac-source-words-in-same-mode-buffers ac-sources)) ;;jediの補完候補だけでいい
(add-to-list 'ac-sources 'ac-source-filename)
(add-to-list 'ac-sources 'ac-source-jedi-direct)

(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-.") 'jedi:goto-definition)
             (local-set-key (kbd "C-c d") 'jedi:show-doc)
             (local-set-key (kbd "C-<tab>") 'jedi:complete)))
(add-hook 'python-mode-hook #'smartparens-mode)

;; flymake-python-pyflakes
(setq flymake-python-pyflakes-executable "flake8")
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;; django-mode
(require 'django-mode)
(use-package django-html-mode
  :mode
  (("\\.djhtml\\'" . django-html-mode))
  )

(add-hook 'python-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
