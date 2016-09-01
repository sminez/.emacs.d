;; Vim leader keybindings
(use-package evil-leader
  :commands (evil-leader-mode global-evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :config
  (progn
    (evil-leader/set-leader "<SPC>")
    (global-evil-leader-mode)
))

;; Vim escape sequence
(use-package evil-escape
  :ensure evil-escape
  :config (evil-escape-mode 1))

;; Evil mode - Vim inside Emacs
(use-package evil
  :ensure evil
  :init (setq evil-want-C-i-jump nil)
  :config
  (progn
    (evil-mode 1)
    (setq evil-search-module 'ag
          evil-magic 'very-magic
          evil-want-fine-undo t
          evil-want-change-word-to-end t)
))

(use-package evil-nerd-commenter
    :ensure evil-nerd-commenter
    :commands (evilnc-comment-or-uncomment-lines))


;; Normal mode key bindings
(define-key evil-normal-state-map (kbd "Y") (kbd "y$"))
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(provide 'my-evil-vim)
