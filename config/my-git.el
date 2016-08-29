(use-package magit
  :ensure magit
  :config
  (progn
    (setq magit-auto-revert-mode nil)
    ;; tell magit not to complain about auto-revert-mode being a new setting
    (setq magit-last-seen-setup-instructions "1.4.0")
))

(use-package evil-magit
  :ensure evil-magit
)

(use-package git-gutter
  :ensure git-gutter
  :config
  (progn
    (global-git-gutter-mode +1)
))

(provide 'my-git)
