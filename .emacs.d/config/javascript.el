(autoload 'js2-mode "js2" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-basic-offset 4)
(setq js2-mirror-mode nil)

(defun my-js2-mode-hook ()
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (if (featurep 'js2-highlight-vars)
    (js2-highlight-vars-mode))
  (defun js-continued-var-decl-list-p ()
    "Return non-nil if point is inside a continued variable declaration
list."
    (interactive)
    (let ((start (save-excursion (js-re-search-backward "\\<var\\>" nil t))))
      (and start
           (save-excursion (re-search-backward "\n" start t))
           (not (save-excursion
                  (js-re-search-backward
                   ";\\|[^, \t][ \t]*\\(/[/*]\\|$\\)" start t))))))
  (defun js-proper-indentation (parse-status)
    "Return the proper indentation for the current line."
    (save-excursion
      (back-to-indentation)
      (let ((ctrl-stmt-indent (js-ctrl-statement-indentation))
            (same-indent-p (looking-at "[]})]\\|\\<case\\>\\|\\<default\\>"))
            (continued-expr-p (js-continued-expression-p)))
        (cond (ctrl-stmt-indent)
              ((js-continued-var-decl-list-p)
               (js-re-search-backward "\\<var\\>" nil t)
               (+ (current-indentation) js2-basic-offset))
              ((nth 1 parse-status)
               (goto-char (nth 1 parse-status))
               (if (looking-at "[({[][ \t]*\\(/[/*]\\|$\\)")
                   (progn
                     (skip-syntax-backward " ")
                     (when (= (char-before) ?\)) (backward-list))
                     (back-to-indentation)
                     (cond (same-indent-p
                            (current-column))
                           (continued-expr-p
                            (+ (current-column) (* 2 js2-basic-offset)))
                           (t
                            (+ (current-column) js2-basic-offset))))
                 (unless same-indent-p
                   (forward-char)
                   (skip-chars-forward " \t"))
                 (current-column)))
              (continued-expr-p js2-basic-offset)
              (t 0)))))
  (message "My JS2 hook"))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)