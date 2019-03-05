;; jedi
(use-package jedi
  :config
  (setq jedi:setup-keys nil)
  (setq jedi:tooltip-method nil)
  (setq jedi:complete-on-dot t)
  (setq ac-sources
        (delete 'ac-source-words-in-same-mode-buffers ac-sources)) ;;jediの補完候補だけでいい
  (add-to-list 'ac-sources 'ac-source-filename)
  (add-to-list 'ac-sources 'ac-source-jedi-direct)
  :hook
  (python-mode . jedi:setup)
  )

(use-package python
  :mode ("\\.py" . python-mode)
  :bind
  (:map python-mode-map
  ("M-." . jedi:goto-definition)
  ("C-c d" . jedi:show-doc)
  ("C-<tab>" . jedi:complete))
  :hook
  (before-save . pyimport-remove-unused)
  (python-mode . (lambda ()
                   (hs-minor-mode 1))))

;; django-mode
(use-package django-mode)

(use-package django-html-mode
  :mode
  (("\\.djhtml\\'" . django-html-mode))
  )

