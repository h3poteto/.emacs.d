;; fiplr
(require 'fiplr)
(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn" "vendor" "tmp" "uploaded_files" "log" "./public" "node_modules" "_vendor" "coverage" "_build" "deps"))
                            (files ("*~" "*.jpg" "*.png" "*.gif" "*.zip" "*.DS_Store"))))
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(global-set-key (kbd "C-x c") 'fiplr-clear-cache)
