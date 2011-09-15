(require 'cl)

(defun package-require (package)
  (unless package-archive-contents (package-refresh-contents))
  (unless (or (member package package-activated-list)
              (functionp package))
    (message "Installing %s" (symbol-name package))
    (package-install package)))

(provide 'packages-deps)
