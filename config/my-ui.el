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
    (spaceline-toggle-minor-modes-off)
    (spaceline-compile)
))

;; Keybinding hints
(use-package which-key
  :ensure which-key
  :config (which-key-mode))

;;Load the main theme at the end to prevent clobbering
(load-theme 'darktooth t)
;; (load-theme 'gruvbox t)
;; (load-theme 'material t)
;; (load-theme 'material-light t)

(provide 'my-ui)
