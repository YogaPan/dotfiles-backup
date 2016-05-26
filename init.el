;; Use melpa to install package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)


;; System executable path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))


;; Backup settings.
;(setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
	  backup-by-copying t    ; Don't delink hardlink
	  version-control t      ; Use version numbers on backups
	  delete-old-versions t  ; Automatically delete excess backups
	  kept-new-versions 20   ; how many of the newest versions to keep
			kept-old-versions 5)   ; and how many of the old


;; Settings for gui emacs
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-face-attribute 'default nil :height 230)
;; (set-frame-font "Hack" 1)
(set-frame-font "Monoid" 1)
(set-cursor-color "red")
(setq-default cursor-type 'bar)


;; Settings for terminal
(menu-bar-mode -1)


;; Setting colorscheme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)


;; Hightlight line
;(global-linum-mode)
(global-hl-line-mode 1)
;(set-face-attribute 'region nil :background "#777")
;(set-face-background 'hl-line "#333")
;(set-face-foreground 'highlight nil)


;; Indent settings.
;(setq-default indent-tabs-mode nil)
;(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)
(add-hook 'python-mode-hook '(lambda ()
							   (setq python-indent 4)))
;(setq js2-basic-offset 2)
;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;(setq js-indent-level 2)

(add-hook 'before-save-hook 'whitespace-cleanup)


;; Smart line
;(setq sml/theme 'light)
;(setq sml/theme 'dark)
(setq sml/theme 'respectful)
(setq sml/no-confirm-load-theme t)
(sml/setup)

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; Smex
(smex-initialize) ; Can be omitted. This might cause a (minimal)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Use evil mode
(setq evil-want-C-u-scroll t)
(evil-mode 1)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
)
(require 'evil-surround)
(global-evil-surround-mode 1)


;; Auto pair
(electric-pair-mode 1)
;; Customize your pairs.
(setq electric-pair-pairs '(
							(?\" . ?\")
							(?\{ . ?\})
							(?\' . ?\')
							(?\` . ?\`)
							) )


;; web-mode settings.
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-block-padding 0)

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-css-colorization t)

;(setq web-mode-enable-block-face t)
(setq web-mode-comment-style 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-quoting nil)

;(setq web-mode-enable-auto-closing t)
;(setq web-mode-tag-auto-close-style 1)


;; Company mode.
;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-tern)
;;(add-to-list 'company-backends 'company-tern)
;; (with-eval-after-load 'company
;;    (add-to-list 'company-backends 'company-jedi))

;; FlyCheck
;; (require 'flycheck)
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
;; (setq-default flycheck-temp-prefix ".flycheck")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
