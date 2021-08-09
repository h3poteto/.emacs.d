(use-package go-mode
  :commands go-mode
  :config
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq gofmt-command "goimports")
  (define-key go-mode-map (kbd "C-c C-k") 'go-fill-struct)
  ;; flycheck is better than flymake in lsp-mode, so disable flymake.
  (setq lsp-prefer-flymake nil)
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))
  (require 'dap-go)
  (defhydra hydra-go-mode (:hint nil :exit t)
"
^Main^
^^^^^^-----------------------------------------------------
_gf_: gofmt                             _gjs_: godef-jump[C-c C-j]
_gu_: go-remove-unused-imports          _gjo_: godef-jump-other-window[C-x 4 C-c C-j]
_gga_: go-goto-arguments[C-c C-f a]     _gdd_: godef-describe[C-c C-d]
_ggd_: go-goto-docstring[C-c C-f d]     _gr_: go-rename
_ggf_: go-goto-function[C-c C-f f]      _gdc_: go-debug-config-generator
_ggr_: go-goto-return-values[C-c C-f r] _dd_: dap-debug
"

("gf" gofmt)
("gu" go-remove-unused-imports)
("gga" go-goto-arguments)
("ggd" go-goto-docstring)
("ggf" go-goto-function)
("ggr" go-goto-return-values)

("gjs" godef-jump)
("gjo" godef-jump-other-window)
("gdd" godef-describe)
("gr" go-rename)
("gdc" go-debug-config-generator)
("dd" dap-debug)

("z" nil "leave"))


  (defun go-debug-config-generator ()
    "Generate debug configuration for Go dap-mode."
    (interactive)
    (let ((tpl (list :type "go")))
      (plist-put tpl :request (if (y-or-n-p "[必須] デバッグ対象は起動中?")
                                  "attach"
                                "launch"))
      (if (y-or-n-p "[必須] デバッグ対象はリモートにある?")
          (plist-put tpl
                     :mode "remote"
                     :host (read-string "[必須] リモートマシンのホスト: ")
                     :port (read-string "[必須] デバッグ対象のポート番号: ")
                     :(region-end)motePath (read-string "[必須] デバッグ対象の絶対パス: "))
        (if (eq (plist-get tpl :request) "attach")
            (plist-put tpl
                       :mode "local"
                       :processId (read-number "[必須] デバッグ対象のプロセスID: "))
          (if (y-or-n-p "[必須] デバッグ対象はテストですか?")
              (progn
                (plist-put tpl :mode "test")
                (let ((func (read-string "テスト関数の指定 (e.g. TestMyFunc) (default: \"\"): "))
                      (build (read-string "ビルドフラグの指定 (e.g. -tags fixtures) (default: \"\"): ")))
                  (if (not (equal func "")) (plist-put tpl :args ("-test.run" func)))
                  (if (not (equal build "")) (plist-put tpl :buildFlags (split-string build)))))
            (plist-put tpl :mode (if (y-or-n-p "[必須] デバッグ対象はソースコードですか?")
                                     "debug"
                                   "exec"))
            (let ((args (read-string "コマンドの指定 (e.g. run) (default: \"\"): ")))
              (if (not (equal args "")) (plist-put tpl :args args))))
          (let ((env (read-string "引数の設定 (e.g. (:env1 var :env2 var2)) (default: \"\"): ")))
            (if (not (equal env "")) (plist-put tpl :env (read env)))))
        (require 'counsel)
        (plist-put tpl :program (ivy-read "[必須] デバッグ対象のファイル(ディレクトリ): " 'read-file-name-internal
                                          :matcher #'counsel--find-file-matcher
                                          :action
                                          (lambda (x)
                                            (print x)))))
      (let ((name (read-string "[必須] 登録するデバッグ設定名: ")))
        (dap-register-debug-template name tpl)
        (message "Register go debug configuration as " name))))

  :bind
  (:map go-mode-map
   ("C-z" . hydra-go-mode/body))
  :hook
  (go-mode . (lambda () (add-hook 'before-save-hook 'gofmt-before-save)))
  (go-mode . (lambda ()
               (hs-minor-mode 1)))
  (go-mode . (lambda ()
               (setq indent-tabs-mode t)))
  (go-mode . lsp)
  (go-mode . flycheck-mode)
  )

(use-package go-fill-struct)
