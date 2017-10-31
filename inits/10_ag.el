; ag
;;(setq default-process-coding-system 'utf-8-unix)  ; ag 検索結果のエンコード指定
(require 'ag)
(setq ag-highlight-search t)  ; 検索キーワードをハイライト
(setq ag-reuse-buffers t)     ; 検索用バッファを使い回す (検索ごとに新バッファを作らない)

; helm
; helm-ag
(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)
(global-set-key (kbd "M-g .") 'helm-ag)
(global-set-key (kbd "M-g r") 'helm-ag-project-root)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)
(custom-set-variables
 '(helm-ag-use-grep-ignore-list "*~")
 '(helm-ag-use-agignore t)
 )

; wgrep
(add-hook 'ag-mode-hook '(lambda ()
                           (require 'wgrep-ag)
                           (setq wgrep-auto-save-buffer t)  ; 編集完了と同時に保存
                           (setq wgrep-enable-key "r")      ; "r" キーで編集モードに
                           (wgrep-ag-setup)))
