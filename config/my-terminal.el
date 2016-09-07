;; multi-term for an in-emacs terminal using my config
(use-package multi-term
  :ensure multi-term
  :config
  (progn
    (setq system-uses-terminfo t)
    (setq multi-term-program "/bin/bash")
    (setq multi-term-scroll-to-bottom-on-output t)
    (setq multi-term-dedicated-select-after-open-p t)
    (add-hook 'shell-mode-hook ansi-color-for-comint-mode)
))

(provide 'my-terminal)
