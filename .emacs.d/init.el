(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (let* ((my-lisp-dir "~/.emacs.d/")
              (default-directory my-lisp-dir))
           (setq load-path (cons my-lisp-dir load-path))
           (normal-top-level-add-subdirs-to-load-path)))

(setq inhibit-startup-message t)
(setq display-battery-mode t)
(setq column-number-mode t)
(setq backup-directory-alist
'(("." . "~/.emacs/backups")))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


(require 'quack)

(require 'paredit)

(require 'color-theme)
(require 'zenburn)
(setq color-theme-is-global t)
(color-theme-zenburn)

(require 'ido)
(ido-mode t)


(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'python-pep8)
(autoload 'python-pep8 "python-pep8")
(require 'python-pylint)
(autoload 'pylint "python-pylint")
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/kmnr.org"
                             "~/org/school.org" 
                             "~/org/personal.org"
                             "~/org/work.org"))


;; Haskell Stuff
(require 'inf-haskell) 

(add-hook 'haskell-mode-hook
       '(lambda ()
          (setq process-connection-type nil)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;; Twitter Stuff
(load "~/.emacs.d/vendor/twitter/twittering-mode.el")
(require 'twittering-mode)
(setq twittering-username "joshbohde")

;; Git Stuff
(require 'magit)

;; Add postmode for sup
(require 'lbdb)
(add-to-list 'auto-mode-alist '("sup\\.\\(compose\\|forward\\|reply\\|resume\\)-mode$" . post-mode))
(add-hook 'post-mode-hook (lambda ()
                            (define-key post-mode-map "\C-c\C-l" 'lbdb)))

(mapc (lambda (mode)
	(let ((hook (intern (concat (symbol-name mode)
				    "-mode-hook"))))
	  (add-hook hook (lambda () (paredit-mode +1)))))
      '(emacs-lisp lisp inferior-lisp inferior-scheme))

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
         (buffer-list))
  (delete-other-windows))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/conkeror")

(custom-set-variables
 '(haskell-program-name "ghci")) 

(require 'xclip)
