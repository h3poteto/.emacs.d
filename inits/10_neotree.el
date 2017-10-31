;; neotree
(use-package neotree
  :bind
  (("<f8>" . neotree-toggle)
   ("C-c n" . neotree-hidden-file-toggle))
  :config
  ;; 隠しファイルをデフォルトで表示
  (setq-default neo-show-hidden-files t)
  (setq neo-create-file-auto-open t)
  (setq neo-keymap-style 'concise)
  (setq neo-smart-open t))
