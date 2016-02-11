(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(add-hook 'after-init-hook 'global-company-mode)

;; Font settings.
(set-face-attribute 'default nil :height 200)
(set-frame-font "Source Code Pro For Powerline" 1)
;; Theme settings.
(load-theme 'brin t)
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-cursor-color "red")
(setq-default cursor-type 'bar)
;(global-linum-mode)
;(global-hl-line-mode 1)
;(set-face-attribute 'region nil :background "#777")
;(set-face-background 'hl-line "#333")
;(set-face-foreground 'highlight nil)

;; Project manager.
(setq inhibit-startup-message t)
(projectile-global-mode)
(add-hook 'fundamental-mode 'projectile-mode)

;; Evil-mode
(evil-mode 1)

;; Magit.
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; Autocomplete settings.
(yas-global-mode 1)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-to-list 'auto-mode-alist '("\\.tern-project\\'" . js-mode))

;; Web end emmet mode.
(add-hook 'web-mode-hook 'emmet-mode)
(setq emmet-move-cursor-between-quotes t)

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

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)

;; Indent settings.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mod t)
(add-hook 'python-mode-hook '(lambda ()
                               (setq python-indent 4)))
;;(setq js2-basic-offset 2)
(setq js-indent-level 2)
(add-hook 'before-save-hook 'whitespace-cleanup)

;; ibuffer-mode
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; smex-mode
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; This is your old M-x

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>")'windmove-left)

;; Backup settings.
;; (setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlink
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5)   ; and how many of the old
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "fa11f855b5f606f84e50106a7360c72aac88fee5f6fb8084aa4329009b61c5a2" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "94ba29363bfb7e06105f68d72b268f85981f7fba2ddef89331660033101eb5e5" "49de25b465bc3c2498bcd4c1575fa0090bd56fc79cdb49b919b49eaea17ee1dd" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
