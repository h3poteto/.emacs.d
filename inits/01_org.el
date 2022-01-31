(use-package org
  :config
  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file "notes.org")
  (setq org-use-speed-commands t)
  (setq org-agenda-files '(
                           "~/Dropbox/org/notes.org"
                           "~/Dropbox/org/todos.org"
                           "~/Dropbox/org/bugs.org"
                           ))
  (setq org-support-shift-select t)
  (setq org-capture-templates
        '(("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes")
           "* %? - %a\nEntered on %U\n %i\n")
          ("t" "Todo" entry (file+headline "~/Dropbox/org/todos.org" "Todos")
           "* %? - %a\nEntered on %U\n %i\n")
          ("b" "Bug" entry (file+headline "~/Dropbox/org/bugs.org" "Bugs")
           "* %? - %a\nEntered on %U\n %i\n")
          ))
  (defhydra hydra-org (:hint nil :exit t)
    "
^Main^
^^^^^^ — — — — — — — — — — — — — — — — — — — — — — — — —
_otd_: org-todo[C-c C-t]
_ocp_: org-copy[C-c M-w]
_oop_: org-open-at-point[C-c C-o]
_ots_: org-time-stamp[C-c .]
_odl_: org-deadline[C-c C-d]
_osc_: org-schedule[C-c C-s]
_osa_: org-show-all
_osu_: org-shiftup[S-up]
_osd_: org-shiftdown[S-down]
_osl_: org_shiftleft[S-left]
_osr_: org_shiftright[S-right]
"
    ("otd" org-todo)
    ("ocp" org-copy)
    ("oop" org-open-at-point)
    ("ots" org-time-stamp)
    ("odl" org-deadline)
    ("osc" org-schedule)
    ("osa" org-show-all)
    ("osu" org-shiftup)
    ("osd" org-shiftdown)
    ("osl" org-shiftleft)
    ("osr" org-shiftright)

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
  :hook
  (org-mode . (lambda () (outline-hide-sublevels 2)))
  )

;; https://qiita.com/takaxp/items/0b717ad1d0488b74429d
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/Dropbox/org/" file))))
