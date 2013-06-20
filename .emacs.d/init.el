(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq inhibit-startup-message t)
(setq display-battery-mode t)
(setq column-number-mode t)
(setq backup-directory-alist
      '(("." . "~/.emacs/backups")))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq custom-theme-load-path dotfiles-dir)

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "config"))
(add-to-list 'load-path (concat dotfiles-dir "vendor"))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(require 'packages-deps)

(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(require 'highlight-indentation)

(require 'multiple-cursors)
(global-set-key (kbd "C-x C-m C-m") 'mc/edit-lines)
(global-set-key (kbd "C-x C-m C-j") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-x C-m C-k") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-x C-m C-a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x C-m C-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-x C-m C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x C-m C-l") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-x C-m C-a") 'mc/mark-all-in-region)


(require 'quack)
(require 'paredit)

(require 'config-colors)

(require 'ido)
(ido-mode t)

(package-require 'perspective)
(require 'perspective)
(persp-mode)

(require 'config-git)
(require 'config-python)
(require 'config-javascript)
(require 'config-haskell)
(require 'config-clojure)
(require 'config-css)
(require 'config-irc)

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/kmnr.org"
                             "~/org/school.org" 
                             "~/org/personal.org"
                             "~/org/work.org"))

(mapc (lambda (mode)
	(let ((hook (intern (concat (symbol-name mode)
				    "-mode-hook"))))
	  (add-hook hook (lambda () (paredit-mode +1)))))
      '(emacs-lisp lisp inferior-lisp inferior-scheme))

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

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

(require 'rainbow-mode)
(add-to-list 'auto-mode-alist '("\\.css$" . rainbow-mode))

(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-create-new-buffer 'always)
(turn-on-xclip)

(package-require 'smex)
(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands) 
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-c C-v") 'browse-url-at-point)


(if (find-font (font-spec :name "Inconsolata-dz for Powerline"))
    (set-face-attribute 'default nil
                        :font "Inconsolata-dz for Powerline:pixelsize=14"))

(require 'find-file-in-repository)
(global-set-key (kbd "C-x f") 'find-file-in-repository)

(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
(setq twittering-use-icon-storage t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(put 'ido-exit-minibuffer 'disabled nil)
