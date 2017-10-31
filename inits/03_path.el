(require 'exec-path-from-shell)
(let ((envs '("PATH" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

(exec-path-from-shell-initialize)
