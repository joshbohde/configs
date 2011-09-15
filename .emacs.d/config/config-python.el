(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'python-pep8)
(autoload 'python-pep8 "python-pep8")
(require 'python-pylint)
(autoload 'pylint "python-pylint")
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

(provide 'config-python)