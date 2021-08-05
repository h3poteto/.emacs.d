(el-get-bundle protobuf-mode)

(use-package protobuf-mode
  :mode
  ("\\.proto$" . protobuf-mode)
  :config
  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)))
  :hook
  (protobuf-mode . (lambda () (c-add-style "my-style" my-protobuf-style t))))
