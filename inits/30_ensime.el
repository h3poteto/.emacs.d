;; ensime
;; smartparens
(add-hook 'scala-mode-hook #'smartparens-mode)

;; for scalariform in ensime
;;(add-hook 'before-save-hook 'ensime-format-source)

;; TODO: プロジェクトごとのscalafmt.confを読むことができない
;; (add-hook 'after-save-hook 'scalafmt-after-save)

;; for scalafmt in brew command
(defcustom scalafmt-command "scalafmt"
  "The scalafmt command."
  :type 'string)
(defcustom scalafmt-args nil
  "Additional arguments to pass to scalafmt."
  :type '(list string))

(defun scalafmt ()
  (interactive)
  (setq errbuf "*Scalafmt Errors*")
  (let (our-scalafmt-args)
    (get-buffer-create errbuf)

    (setq our-scalafmt-args
          (append scalafmt-args
                  (list (file-truename buffer-file-name))))
    ;; 現在のバッファに対してfmtしたい場合は以下を使う
    ;; しかし渡し方に問題があり動作しない
    ;; (setq our-scalafmt-args
    ;;       (append scalafmt-args
    ;;               (list "--stdin" (buffer-string))))
    (message "Calling scalafmt: %s %s" scalafmt-command (mapconcat 'identity our-scalafmt-args " "))
    (apply #'call-process scalafmt-command nil errbuf nil our-scalafmt-args)
    (if (equal (buffer-size (get-buffer errbuf)) 0)
        (kill-buffer errbuf))
    (revert-buffer-no-confirm)))

(defun scalafmt-after-save ()
  (interactive)
  (when (eq major-mode 'scala-mode) (scalafmt)))
