;; backspace
(keyboard-translate ?\C-h ?\C-?)

;; newline and indent
(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent)

;; 多くのアプリのようにCommand + (+|-|0)でズームイン/アウトを行えるようにする
; ズームイン
(global-set-key (kbd "s-+") (lambda () (interactive) (text-scale-increase 1)))
; ズームアウト
(global-set-key (kbd "s--") (lambda () (interactive) (text-scale-decrease 1)))
; デフォルトに戻す
(global-set-key (kbd "s-0") (lambda () (interactive) (text-scale-increase 0)))

;; 一括コメントアウト
(define-key global-map(kbd "C-c :") 'comment-or-uncomment-region)

;; 一括インデント
;; file-infoとかぶるし使わないので無効化する
;; (define-key global-map(kbd "C-c i") 'indent-region)

;; jamp goto line
(global-set-key (kbd "C-x :") 'goto-line)

;; find
(global-set-key "\C-x\C-f" 'find-name-dired)

;; reload buffer
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
