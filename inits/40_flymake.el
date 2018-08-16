;; 現在行のエラーを表示する
(global-set-key (kbd "C-c C-e") 'flymake-popup-current-error-menu)

;; 次のエラーまでジャンプ
(defun next-flymake-error ()
  (interactive)
  (flymake-goto-next-error)
  (let ((err (get-char-property (point) 'help-echo)))
    (when err
      (message err))))
(global-set-key (kbd "C-c e") 'next-flymake-error)
