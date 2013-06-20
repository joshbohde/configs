(package-require 'slime)
(package-require 'rainbow-delimiters)

(defun my-clojure-hook () 
  (paredit-mode 1)
  (rainbow-delimiters-mode 1))
(add-hook 'clojure-mode-hook 'my-clojure-hook)

(package-require 'clojure-mode)
(require 'clojure-mode)

(package-require 'clojurescript-mode)
(require 'clojurescript-mode)


(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
;;(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-test-mode))
(add-to-list 'auto-mode-alist '("\.cljs$" . clojurescript-mode))

(package-require 'nrepl)
(require 'nrepl)

(require 'midje-mode)

(require 'align-cljlet)

(provide 'config-clojure)
