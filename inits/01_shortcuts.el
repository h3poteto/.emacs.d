(global-set-key "\C-m" 'newline-and-indent)

;; 多くのアプリのようにCommand/Ctrl + (+|-|0)でズームイン/アウトを行えるようにする
; ズームイン
(global-set-key (kbd "s-+") (lambda () (interactive) (text-scale-increase 1)))
(global-set-key (kbd "C-+") (lambda () (interactive) (text-scale-increase 1)))
; ズームアウト
(global-set-key (kbd "s--") (lambda () (interactive) (text-scale-decrease 1)))
(global-set-key (kbd "C--") (lambda () (interactive) (text-scale-decrease 1)))
; デフォルトに戻す
(global-set-key (kbd "s-0") (lambda () (interactive) (text-scale-increase 0)))
(global-set-key (kbd "C-0") (lambda () (interactive) (text-scale-increase 0)))

;; 一括コメントアウト
(define-key global-map(kbd "C-c :") 'comment-or-uncomment-region)

;; jamp goto line
(global-set-key (kbd "C-x :") 'goto-line)

;; find
(global-set-key "\C-x\C-f" 'find-name-dired)

;; ;; reload buffer
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

;; counsel-imenu
(global-set-key "\M-a" 'counsel-imenu)

;; query-replaceを別のキーに変更
(global-set-key (kbd "C-c C-r") 'query-replace)
(global-set-key (kbd "C-c r") 'query-replace)

;; toggle line
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;; move multiple window with arrow keys
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; mozc
(global-set-key (kbd "<henkan>") (lambda () (interactive) (mozc-mode 1)))

(setq w32-alt-is-meta nil)
