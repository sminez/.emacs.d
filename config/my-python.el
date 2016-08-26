(use-package python-mode
  :commands python-mode
  :mode "\\.py\\'"
  :init
  (progn
    (add-to-list 'auto-mode-alist '("/PYDOCS\\'" . help-mode))
    (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
    (add-to-list 'interpreter-mode-alist '("python3.5" . python-mode))
  )
  :config
  (progn
    (setq py-electric-comment-p nil)
    (setq py-max-help-buffer-p nil)
    (setq py-electric-comment-add-space-p nil)
    (setq py-tab-indent nil)
    (setq py-smart-indentation t)
    (setq py-return-key 'py-newline-and-indent)
    (setq py-complete-function nil)
    (setq py-empty-line-closes-p nil)
))


(use-package company-anaconda
  :ensure company-anaconda
  :config
  (progn
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
    (setq python-shell-interpreter "python3.5")
))

  
