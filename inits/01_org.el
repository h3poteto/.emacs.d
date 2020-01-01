(setq org-directory "~/OneDrive/org")
(setq org-default-notes-file "notes.org")

(define-key global-map(kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/OneDrive/org/notes.org" "Notes")
         "* %? - %a\nEntered on %U\n %i\n")
        ("t" "Todo" entry (file+headline "~/OneDrive/org/todos.org" "Todos")
         "* %? - %a\nEntered on %U\n %i\n")
        ("b" "Bug" entry (file+headline "~/OneDrive/org/bugs.org" "Bugs")
         "* %? - %a\nEntered on %U\n %i\n")
        ))

; https://qiita.com/takaxp/items/0b717ad1d0488b74429d
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/OneDrive/org/" file))))
(global-set-key (kbd "C-c C-o n") '(lambda () (interactive)
                                     (show-org-buffer "notes.org")))
(global-set-key (kbd "C-c C-o t") '(lambda () (interactive)
                                     (show-org-buffer "todos.org")))
(global-set-key (kbd "C-c C-o b") '(lambda () (interactive)
                                     (show-org-buffer "bugs.org")))

(setq org-use-speed-commands t)
