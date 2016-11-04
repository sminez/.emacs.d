;;;;;;;;;;;;;;;;;;;;;;;
;; General utilities ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; Real time linting
(use-package flycheck
  :ensure flycheck
  :init (global-flycheck-mode))

;; Helm fuzzy match / narrowing framework
(use-package helm
  :ensure helm
  :config
  (progn
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-split-window-in-side-p nil)
    (setq helm-adaptive-history-file "~/.emacs.d/helm-adapative-history")
    ; rebind tab to do persistent action
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    ; make TAB works in terminal
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
    ; list actions using C-z
    (define-key helm-map (kbd "C-z") 'helm-select-action)

    (helm-mode 1)
    (helm-autoresize-mode 1)
    (setq helm-quick-update t)

    (eval-after-load 'projectile
      (use-package helm-projectile
        :ensure helm-projectile))

    (eval-after-load 'company
      (use-package helm-company
        :ensure helm-company))

    (defun helm-jump ()
      "Find files with helm, but be smart about buffers and recent files."
      (interactive)
      (let ((helm-ff-transformer-show-only-basename nil))
        (helm-other-buffer '(helm-projectile-sources-list
                             helm-source-buffers-list
                             helm-source-recentf
                             helm-source-bookmarks
                             helm-source-file-cache
                             helm-source-files-in-current-dir
                             helm-source-locate
                             helm-source-buffer-not-found)
                           "*helm jump*")))

    (use-package helm-swoop
      :ensure helm-swoop
      :config
      (progn
        ;; Don't start searching for the thing at point by default.
        (setq helm-swoop-pre-input-function (lambda () ()))
	(setq helm-swoop-split-direction 'split-window-vertically)
	(setq helm-swoop-use-fuzzy-match t)))
))


;; Avy extends VIM style f/F t/T motions
(use-package avy
  :ensure avy
  :diminish avy
  :config
  (progn
    (setq avy-all-windows t)
    (setq avy-timeout-seconds 0.6)
    ))


;; Hydra `micro-states` allow you to make a temporary mode
;; Note: Hydras are defined in the my-hydras.el file
(use-package hydra
  :ensure hydra
  :diminish hydra)


;; Comp[lete]any[thing] autocompletion framework
(use-package company
  :ensure company
  :diminish company
  :init
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-auto-complete t)
))

;; SLIME for better lisp interaction
(use-package elisp-slime-nav
  :ensure elisp-slime-nav
  :config
  (progn
    (defun my-lisp-hook ()
      (elisp-slime-nav-mode)
      (turn-on-eldoc-mode)
      )
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)
))

(use-package paredit
  :ensure paredit)

(use-package docker
  :ensure docker
  :diminish docker)


(provide 'my-utils)
