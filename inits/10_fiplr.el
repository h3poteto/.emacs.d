;; fiplr
(use-package fiplr
  :bind
  (("C-x f" . fiplr-find-file)
   ("C-x c" . fiplr-clear-cache))
  :config
  (progn
    (setq fiplr-root-markers '(".git" ".svn" ".hg"))
    (setq fiplr-ignored-globs '((directories (".git" ".svn" "vendor" "tmp" "uploaded_files" "log" "./public" "node_modules" "_vendor" "coverage" "_build" "deps" "el-get"))
                               (files ("*~" "*.jpg" "*.png" "*.gif" "*.zip" "*.DS_Store"))))))
