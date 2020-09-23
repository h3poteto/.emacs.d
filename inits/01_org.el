(use-package org
  :config
  (setq org-directory "~/OneDrive/org")
  (setq org-default-notes-file "notes.org")
  (setq org-use-speed-commands t)
  (setq org-agenda-files '(
                           "~/OneDrive/org/notes.org"
                           "~/OneDrive/org/todos.org"
                           "~/OneDrive/org/bugs.org"
                           ))
  (setq org-capture-templates
        '(("n" "Note" entry (file+headline "~/OneDrive/org/notes.org" "Notes")
           "* %? - %a\nEntered on %U\n %i\n")
          ("t" "Todo" entry (file+headline "~/OneDrive/org/todos.org" "Todos")
           "* %? - %a\nEntered on %U\n %i\n")
          ("b" "Bug" entry (file+headline "~/OneDrive/org/bugs.org" "Bugs")
           "* %? - %a\nEntered on %U\n %i\n")
          ))
  (defhydra hydra-org (:hint nil :exit t)
    "
^Main^
^^^^^^ — — — — — — — — — — — — — — — — — — — — — — — — —
_ot_: org-todo[C-c C-t]
_oc_: org-copy[C-c M-w]
_oo_: org-open-at-point[C-c C-o]
_ot_: org-time-stamp[C-c .]
_os_: org-schedule[C-c C-s]
_oa_: org-show-all
"
    ("ot" org-todo)
    ("oc" org-copy)
    ("oo" org-open-at-point)
    ("ot" org-time-stamp)
    ("os" org-schedule)
    ("oa" org-show-all)

    ("z" nil "leave")
    )
  :bind
  (("C-c c" . org-capture)
   ("C-c a" . org-agenda)
   ("C-c C-o n" . (lambda () (interactive) (show-org-buffer "notes.org")))
   ("C-c C-o t" . (lambda () (interactive) (show-org-buffer "todos.org")))
   ("C-c C-o b" . (lambda () (interactive) (show-org-buffer "bugs.org")))
   )
  :bind
  (:map org-mode-map
        ("C-z" . hydra-org/body))
  )

;; https://qiita.com/takaxp/items/0b717ad1d0488b74429d
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/OneDrive/org/" file))))
