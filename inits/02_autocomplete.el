;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)
(setq ac-auto-start 2)  ;; n文字以上の単語の時に補完を開始
(setq ac-ignore-case nil)  ;; 大文字・小文字を区別する
(ac-set-trigger-key "TAB")

;; auto-complete の候補に日本語を含む単語が含まれないようにする
;; http://d.hatena.ne.jp/IMAKADO/20090813/1250130343
(defadvice ac-word-candidates (after remove-word-contain-japanese activate)
  (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
    (setq ad-return-value
          (remove-if contain-japanese ad-return-value))))
