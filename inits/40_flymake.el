;; emacs 26ではflymake-popup-current-error-menuが提供されていない

;; ;; 現在行のエラーを表示する
;; (global-set-key (kbd "C-c C-e") 'flymake-popup-current-error-menu)

;; 次のエラーまでジャンプ
(global-set-key (kbd "C-c e") 'flymake-goto-next-error)
