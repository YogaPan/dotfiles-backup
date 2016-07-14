;; Settings for gui emacs
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-face-attribute 'default nil :height 230)
(set-frame-font "Monoid" 1)
(set-cursor-color "red")
(setq-default cursor-type 'bar)

;; Settings for terminal
(menu-bar-mode -1)

;; Hightlight line
(global-hl-line-mode 1)
;; (global-linum-mode)
;; ( set-face-attribute 'region nil :background "#777")
;; (set-face-background 'hl-line "#333")
;; (set-face-foreground 'highlight nil)

;; Setting colorscheme
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

;; Smart line
(setq sml/theme 'respectful)  ; dark, light or respectful
(setq sml/no-confirm-load-theme t)
(sml/setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

(provide 'init-theme)
