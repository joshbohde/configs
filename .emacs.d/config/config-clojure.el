(defun my-clojure-hook () 
  (paredit-mode 1)
  (rainbow-delimiters-mode 1))
(add-hook 'clojure-mode-hook 'my-clojure-hook)

(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(provide 'config-clojure)