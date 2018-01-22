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
(blink-cursor-mode 0)
(setq-default indent-tabs-mode nil
              tab-width 4)
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

;; Highlight todos
(use-package hl-todo
  :ensure hl-todo
  :config
  (progn
    (global-hl-todo-mode)
    (setq hl-todo-keyword-faces
          '(("TODO" . hl-todo)
            ("NOTE" . hl-todo)))
    (with-eval-after-load 'hl-todo
      (hl-todo-set-regexp))
))

;; Provide syntax highlighting for markdown files
(use-package markdown-mode
  :ensure markdown-mode)

;; Enable transparency and increases it when Emacs looses focus
;; (set-frame-parameter (selected-frame) 'alpha '(95 . 60))
;; (add-to-list 'default-frame-alist '(alpha . (95 . 60)))

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
(setq create-lockfiles nil)

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
  :diminish linum-relative
  :config
  (progn
    (linum-relative-global-mode)
    (linum-relative-on)
))

;; Powerline style info bare at the bottom
(use-package spaceline
  :ensure spaceline
  :diminish spaceline
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
  :diminish which-key
  :config
  (progn
    (setq which-key-key-replacement-alist
    '(("<\\([[:alnum:]-]+\\)>" . "\\1")
      ("left"                  . "◀")
      ("right"                 . "▶")
      ("up"                    . "▲")
      ("down"                  . "▼")
      ("delete"                . "DEL") ; delete key
      ("\\`DEL\\'"             . "BS") ; backspace key
      ("next"                  . "PgDn")
      ("prior"                 . "PgUp")))

    ;; List of "special" keys for which a KEY is displayed as just
    ;; K but with "inverted video" face... not sure I like this.
    (setq which-key-special-keys '("RET" "DEL" ; delete key
                                   "ESC" "BS" ; backspace key
                                   "SPC" "TAB"))

    (which-key-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Load the main theme at the end to prevent clobbering ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package white-sand-theme
;;   :ensure white-sand-theme)

;; (use-package darktooth-theme
;;   :ensure darktooth-theme)

;; (use-package gruvbox-theme
;;   :ensure gruvbox-theme)

;; (use-package base16-theme
;;   :ensure base16-theme)

(defvar *my-current-theme* 'base16-eighties)
(load-theme *my-current-theme*)

;; Variables that are used in my/toggle-theme
(defvar *my-themes* '(white-sand base16-eighties)) ;;darktooth base16-mexico-light))

(provide 'my-ui)
