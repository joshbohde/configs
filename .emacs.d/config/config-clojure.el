(defun my-clojure-hook () 
  (paredit-mode 1)
  (rainbow-delimiters-mode 1))
(add-hook 'clojure-mode-hook 'my-clojure-hook)

(require 'clojure-mode)
(require 'clojurescript-mode)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
;;(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-test-mode))
(add-to-list 'auto-mode-alist '("\.cljs$" . clojurescript-mode))

(provide 'config-clojure)