;; Avy
;; (avy-setup-default)
;; (setq avy-line-insert-style 'below)
;; (global-set-key (kbd "C-'") 'avy-goto-char-2)
;; (global-set-key (kbd "C-;") 'avy-goto-line)

;; Expand-region
;; (require 'expand-region)
;; (global-set-key (kbd "C-=") 'er/expand-region)

;; Multiple-cursors
;; (require 'multiple-cursors)
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Smex
(smex-initialize) ; Can be omitted. This might cause a (minimal)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Evil
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(require 'evil-magit)

;; Company mode.
;(require 'company)
;(add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-tern)
;(add-to-list 'company-backends 'company-jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;(setq py-python-command "/usr/local/bin/python3")

;(setq jedi:environment-root "jedi")  ; or any other name you like
;(setq jedi:environment-virtualenv
;      (append python-environment-virtualenv
;              '("--python" "/usr/local/bin/python3")))


;; FlyCheck
;; (require 'flycheck)
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; customize flycheck temp file prefix
;; (setq-default flycheck-temp-prefix ".flycheck")

;; Auto pair
(electric-pair-mode 1)
;; Customize your pairs.
(setq electric-pair-pairs
      '((?\" . ?\")
        (?\` . ?\`)
        (?\[ . ?\])
        (?\{ . ?\})))

;; Indent settings.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Auto delete trailing space
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Use space instead any charactor.
(setq search-whitespace-regexp ".*?")
(setq lazy-highlight-cleanup nil)

(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; (setq show-paren-style 'expression)

(defun my/before-line ()
  (interactive)
  (move-beginning-of-line 1)
  (newline)
  (previous-line)
  (indent-according-to-mode))

(defun my/after-line ()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(defun my/insert-line-before (times)
  "Inserts a newline(s) above the line containing the cursor."
  (interactive "p")
  (save-excursion
    (move-beginning-of-line 1)
    (newline times)))

(global-set-key (kbd "M-o")
                'my/before-line)
(global-set-key (kbd "C-o")
                'my/after-line)
;; Auto complete from buffer.
(global-set-key (kbd "TAB") 'dabbrev-expand)
;; Use imenu
(global-set-key (kbd "C-x i") 'imenu)
(global-set-key (kbd "M-i") 'indent-region)
;; Use shift and arrow to move between buffer window.
(windmove-default-keybindings 'shift)

(provide 'init-edit)
