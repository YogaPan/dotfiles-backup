; Use melpa to install package
(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))
;; (setq package-enable-at-startup nil)
(setq package-list
      '(color-theme-solarized
        smart-mode-line
        projectile
        magit
        smex
        ido-vertical-mode
        ido-ubiquitous
        avy
        expand-region
        multiple-cursors
        evil
        evil-magit
        web-mode
        markdown-mode
        flycheck
        company
        company-jedi))

(package-initialize)

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-package)
