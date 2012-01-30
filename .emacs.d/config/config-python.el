(require 'python)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("ipython" . python-mode))

;(require 'python-pep8)
;(autoload 'python-pep8 "python-pep8")
;(require 'python-pylint)
;(autoload 'pylint "python-pylint")

(setq python-shell nil)
(require 'virtualenv)
(setq virtualenv-workon-starts-python nil)


(setq
  python-shell-interpreter "ipython"
  python-shell-interpreter-args ""
  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
  python-shell-completion-setup-code
    "from IPython.core.completerlib import module_completion"
  python-shell-completion-module-string-code
    "';'.join(module_completion('''%s'''))\n"
  python-shell-completion-string-code
    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(defun workon (&optional env)
  (interactive "P")
  (let ((env
         (cond
          ((stringp env) env)
          (t (read-from-minibuffer "Virtualenv to activate: ")))))
    (setq python-shell-virtualenv-path (concat "~/.virtualenvs/" env))))


(provide 'config-python)