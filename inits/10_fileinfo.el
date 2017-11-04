;;file-info
(defun file-info () "
カレントバッファのファイル情報を表示する。"
  (interactive)
  (if (buffer-file-name (current-buffer))
      (progn
        (let* ((file-name (buffer-file-name (current-buffer)))
               (f-attr (file-attributes file-name))
               (a-time (nth 4 f-attr))  ; 最終アクセス時刻
               (m-time (nth 5 f-attr))  ; 最終修正時刻
               (f-size (nth 7 f-attr))  ; ファイルサイズ
               (f-mode (nth 8 f-attr))  ; ファイル属性
               (mes1 (format "ファイルパス:   %s\n" file-name))
               (mes2 (format "最終参照時刻:   %s\n"
                              (format-time-string
                               "%Y-%m-%d %H:%M:%S" a-time)))
               (mes3 (format "最終修正時刻:   %s\n"
                              (format-time-string
                               "%Y-%m-%d %H:%M:%S" m-time)))
               (mes4 (format "ファイルサイズ: %s byte\n" f-size))
               (mes5 (format "ファイル属性:   %s" f-mode))
               (mess (concat mes1 mes2 mes3 mes4 mes5)))
          (message "%s" mess)))
    nil ))

(global-set-key (kbd "C-c i") 'file-info)
