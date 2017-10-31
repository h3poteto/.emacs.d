;; ag
;; ag 検索結果のエンコード指定
;;(setq default-process-coding-system 'utf-8-unix)

(use-package ag
  :config
  ;; 検索結果のハイライト
  (setq ag-highlight-search t)
  ;; 検索用バッファを使いまわす
  (setq ag-reuse-buffers t)
  (add-hook 'ag-mode-hook 'wgrep-ag-setup))

;; helm
(use-package helm-config)
(use-package helm-files)

;; helm-ag
(use-package heml-ag
  :bind
  (("M-g ." . helm-ag)
   ("M-g r" . helm-ag-project-root)
   ("M-g /" . helm-ag-pop-stack))
  :config
  (custom-set-variables
   '(helm-ag-use-grep-ignore-list "*~")
   '(helm-ag-use-agignore t)
   ))

;; wgrep-ag
(use-package wgrep-ag
  :after ag
  :config
  (setq wgrep-auto-save-buffer t)  ; 編集完了と同時に保存
  (setq wgrep-enable-key "r"))      ; "r" キーで編集モードに
