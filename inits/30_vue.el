;; vue-mode
;; 内部でcss-modeを使用するときにオフセットを変更したい
(add-hook 'vue-mode-hook
          (lambda ()
            (setq css-indent-offset 2)))
