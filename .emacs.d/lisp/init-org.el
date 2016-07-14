;; Org Mode
(add-hook 'org-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-'") 'avy-goto-char-2)
             (local-set-key (kbd "C-;") 'avy-goto-line)))

(eval-after-load "org"
  '(require 'ox-md nil t))

(org-babel-do-load-languages
 'org-babel-load-languages '((C   . t)
                             (sh . t)
                             (dot . t)))

(provide 'init-org)
