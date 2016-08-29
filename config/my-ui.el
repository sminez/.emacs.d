;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI and general system settings for my Emacs setup ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "I.D.A-M")
(setq user-mail-address "innes.morrison@cocoon.life")

;; Assorted self-explanitory settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)
(scroll-bar-mode -1)
(show-paren-mode 1)
(visual-line-mode 1)
(setq-default indent-tabs-mode nil)
(setq require-final-newline t
      scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Enable the mouse in terminal mode.
(xterm-mouse-mode 1)

;; Allow y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Have rainbow parens if we're in a code buffer
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Enable transparency and increases it when Emacs looses focus
(set-frame-parameter (selected-frame) 'alpha '(95 . 60))
(add-to-list 'default-frame-alist '(alpha . (95 . 60)))

;; Disable the annoying splash screen
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      initial-scratch-message nil)

;; Stash the autosave files away where they won't litter my tree!
(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Directory used for Emacs backups.")
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-folder t)))

;; Store auto-gen config stuff in its own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; UTF-8 by default please
(setq locale-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(defmacro after (feature &rest body)
  "after FEATURE is loaded, evaluate BODY"
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; Vim-like relative numbers
(use-package linum-relative
  :ensure linum-relative
  :config
  (progn
    (linum-relative-global-mode)
    (linum-relative-on)
))

;; Powerline style info bare at the bottom
(use-package spaceline
  :ensure spaceline
  :config
  (progn
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)
    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
    (setq powerline-default-separator 'wave)
    (spaceline-compile)
))

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

    (after 'projectile
      (use-package helm-projectile
        :ensure helm-projectile))

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


;; Avy extends VIM style f/F motions
(use-package avy
  :ensure avy
  :config
  (progn
    (setq avy-all-windows t)
    (setq avy-timeout-seconds 0.6)
    (define-key evil-normal-state-map (kbd "M-a") 'avy-goto-char-timer)
    (define-key evil-normal-state-map (kbd "M-l") 'avy-goto-line)
    ))


;; Comp[lete]any[thing] autocompletion framework
(use-package company
  :ensure company
  :init
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-auto-complete t)
))

;; Keybinding hints
(use-package which-key
  :ensure which-key
  :config (which-key-mode))

;; SLIME for better lisp interaction
(use-package elisp-slime-nav
  :defer t
  :ensure elisp-slime-nav
  :config
  (progn
    (defun my-lisp-hook ()
      (elisp-slime-nav-mode)
      (turn-on-eldoc-mode)
      )
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)
))


;; Load the main theme at the end to prevent clobbering
(load-theme 'darktooth t)
;; (load-theme 'gruvbox t)
;; (load-theme 'material t)
;; (load-theme 'material-light t)

(provide 'my-ui)
