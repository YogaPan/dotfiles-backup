(add-hook 'python-mode-hook
          '(lambda ()
             (setq python-indent 4)
             (setq indent-tabs-mode nil)))

(defvar python-electric-pairs '((?\' . ?\')) "Electric pairs for python-mode.")
(defun python-add-electric-pairs ()
  (setq-local electric-pair-pairs (append electric-pair-pairs python-electric-pairs))
  (setq-local electric-pair-text-pairs electric-pair-pairs))
(add-hook 'python-hook 'python-add-electric-pairs)


(provide 'init-python)
