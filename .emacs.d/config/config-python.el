(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'python-pep8)
(autoload 'python-pep8 "python-pep8")
(require 'python-pylint)
(autoload 'pylint "python-pylint")


(add-hook 'python-mode-hook
          (lambda ()
            (define-key py-mode-map "\M-p" 'flymake-goto-prev-error)
            (define-key py-mode-map "\M-n" 'flymake-goto-next-error)))

(when (load "flymake" t)
  (require 'flymake-cursor)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
           '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'find-file-hook 'flymake-find-file-hook)


(provide 'config-python)