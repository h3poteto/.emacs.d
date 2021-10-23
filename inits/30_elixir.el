(use-package elixir-mode
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :init
  (add-to-list 'exec-path (locate-user-emacs-file ".elixir-ls"))
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
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
  (elixir-mode . flycheck-mode)
  (elixir-mode . lsp)
  )

(use-package flycheck-elixir
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :after
  elixir-mode
  )
