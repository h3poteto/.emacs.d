(use-package protobuf-mode
  :if (eq (ignore-minor-mode 'ignore-protobuf-mode) nil)
  :mode
  ("\\.proto$" . protobuf-mode)
  :config
  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)))
  :hook
  (protobuf-mode . (lambda () (c-add-style "my-style" my-protobuf-style t))))
