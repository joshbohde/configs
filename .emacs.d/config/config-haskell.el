;; Haskell Stuff
(package-require 'haskell-mode)

(require 'inf-haskell) 
(add-hook 'haskell-mode-hook
       '(lambda ()
          (setq process-connection-type nil)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'config-haskell)