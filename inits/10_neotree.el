;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; 隠しファイルをデフォルトで表示
(setq-default neo-show-hidden-files t)
(define-key global-map(kbd "C-c n") 'neotree-hidden-file-toggle)
;; neotree でファイルを新規作成した後、自動的にファイルを開く
(setq neo-create-file-auto-open t)
;; キーバインドをシンプルにする
(setq neo-keymap-style 'concise)
;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
(setq neo-smart-open t)
