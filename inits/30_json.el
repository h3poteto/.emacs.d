(use-package json-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-json-mode) nil)
  :mode
  ("\\.json$" . json-mode)
  ("\\.json.tpl$" . json-mode)
  :config
  ;; json-modeは内部でjs-modeを利用しておりindentの設定もjsのものを利用する
  (setq js-indent-level 2)
  (setq indent-tabs-mode nil)
  :hook
  (json-mode . flycheck-mode)
  )
