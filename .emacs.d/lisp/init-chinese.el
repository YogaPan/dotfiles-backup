(global-set-key (kbd "C-ㄙ") 'next-line)              ; C-n
(global-set-key (kbd "C-ㄣ") 'previous-line)          ; C-p
(global-set-key (kbd "C-ㄑ") 'forward-char)           ; C-f
(global-set-key (kbd "C-ㄖ") 'backward-char)          ; C-b
(global-set-key (kbd "C-ㄇ") 'move-beginning-of-line) ; C-a
(global-set-key (kbd "C-ㄍ") 'move-end-of-line)       ; C-e

(global-set-key (kbd "C-ㄜ") 'kill-line)              ; C-k
(global-set-key (kbd "C-ㄎ") 'delete-char)            ; C-d

(global-set-key (kbd "C-ㄌ C-ㄋ") 'save-buffer)       ; C-x C-s
(global-set-key (kbd "C-ㄌ C-ㄑ") 'ido-find-file)     ; C-x C-f
(global-set-key (kbd "C-ㄌ C-ㄖ") 'ibuffer)           ; C-x C-b
(global-set-key (kbd "C-ㄌ ㄖ") 'switch-to-buffer)    ; C-x b

(global-set-key (kbd "C-ㄋ") 'isearch-forward)         ; C-s
(global-set-key (kbd "C-ㄐ") 'isearch-backward)        ; C-r

;; (global-set-key (kbd "M-ㄌ") 'execute-extended-command)       ; M-x
(global-set-key (kbd "M-ㄌ") 'smex)       ; M-x
(global-set-key (kbd "C-ㄕ") 'keyboard-escape-quit)           ; C-g

(provide 'init-chinese);
