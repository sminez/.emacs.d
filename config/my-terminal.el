;; multi-term for an in-emacs terminal using my config
(use-package multi-term
  :ensure multi-term
  :config
  (progn
    (setq multi-term-program "/usr/bin/zsh")
    (setq multi-term-scroll-to-bottom-on-output nil)
    (setq multi-term-dedicated-select-after-open-p t)
))

(provide 'my-terminal)
