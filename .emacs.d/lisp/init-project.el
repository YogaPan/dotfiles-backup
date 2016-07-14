;; Projectile
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
;; (setq projectile-enable-caching t)
(setq inhibit-startup-screen t)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; Use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer t t))

(add-to-list 'auto-mode-alist '("\\.gitignore\\'" . text-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . text-mode))
(add-to-list 'auto-mode-alist '("\\.fish\\'" . sh-mode))

(provide 'init-project)
