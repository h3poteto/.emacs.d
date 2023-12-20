(use-package elixir-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :init
  (add-to-list 'exec-path (locate-user-emacs-file ".elixir-ls"))
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))


  ;; To work credo and lsp with flycheck
  ;; https://elixirforum.com/t/emacs-elixir-setup-configuration-wiki/19196/108
  (add-hook 'elixir-mode-hook
            (lambda ()
              (setq lsp-flycheck-live-reporting nil)
              (setq-local flycheck-check-syntax-automatically '(mode-enabled save))))
  (add-hook 'lsp-after-initialize-hook
            (lambda ()
              (flycheck-add-next-checker 'lsp 'elixir-credo)))

  (setq lsp-elixir-dialyzer-enabled nil)
  (defhydra hydra-elixir-mode (:hint nil :exit t)
"
^Main^
^^^^^^-----------------------------------------------------
_eb_: elixir-beginning-of-defun
_ee_: elixir-end-of-defun
_ed_: elixir-mode-open-docs-master
"

("eb" elixir-beginning-of-defun)
("ee" elixir-end-of-defun)
("ed" elixir-mode-open-docs-master)

("z" nil "leave"))

  :bind
  (:map elixir-mode-map
   ("C-z" . hydra-elixir-mode/body))
  :hook
  (elixir-mode . (lambda ()
                   (hs-minor-mode 1)))
  (elixir-mode . lsp)
  (elixir-mode . flycheck-mode)
  (elixir-mode . flycheck-credo-setup)
  )

(use-package flycheck-elixir
  :straight t
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :after
  elixir-mode
  :config
  (setq flycheck-elixir-credo-checks-with-tag "target")
  )

