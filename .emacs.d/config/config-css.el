(package-require 'flymake-csslint)
(require 'flymake-csslint)
(add-hook 'css-mode-hook 'flymake-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

(setq auto-mode-alist
       (append '(("\\.css$" . css-mode))
               auto-mode-alist))
(provide 'config-css)