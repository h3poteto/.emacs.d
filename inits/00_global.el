;; encoding
(prefer-coding-system 'utf-8)

;; バックスラッシュ
(define-key global-map [?¥] [?\\])

;; Finderから開く際に新しいウィンドウを生成しない
(setq ns-pop-up-frames nil)

;; common indent
(setq-default indent-tabs-mode nil)

;; Warning の抑制
(setq large-file-warning-threshold nil)

;; revert-buffer
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

;; 矩形選択
;; cua
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; タブ
(setq default-tab-width 4)

;; delete region
(delete-selection-mode t)
