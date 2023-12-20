;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defun ignore-minor-mode (ignored-mode)
  (and (eq (boundp ignored-mode) t) (eq (symbol-value ignored-mode) t)))

(add-to-list 'load-path (locate-user-emacs-file "packages"))
(load "ignore.el")

(straight-use-package 'use-package)


(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(straight-use-package 'init-loader)
(init-loader-load "~/.emacs.d/inits")

