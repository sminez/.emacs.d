;; All of my key bindings so they can be loaded at the end

;; Namespacing - (Totally stolen from Spacemacs!)
;; , -> major mode (defined in the individual my-<major>.el files
;; f -> [f]iles
;; b -> [b]uffers
;; w -> [w]indows
;; g -> [g]it
;; o -> [o]rg mode
;; p -> [p]rojectile
;; s -> [s]earch
;; t -> [t]oggles
;; u -> [u]utilities

;; Leader keymap
(evil-leader/set-key
  ;; Show key bindings and commands
  "<SPC>" 'which-key-show-top-level
  "x" 'helm-M-x
  ;; Files
  "fo" 'helm-find-files
  "fs" 'save-buffer
  ;; Buffers
  "bb" 'helm-mini
  "bn" 'evil-buffer
  "bd" 'kill-buffer
  ;; Search and Docs
  "sa" 'helm-apt
  "sf" 'helm-find
  "sg" 'helm-ag
  "sr" 'helm-grep
  "si" 'helm-semantic-or-imenu
  "ss" 'helm-swoop
  ;; Selections
  "vv" 'evil-visual-line
  "vc" 'evil-visual-block
  ;; Windows
  "w/" 'split-window-right
  "wh" 'evil-window-left
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "wl" 'evil-window-right
  "wd" 'evil-window-delete
  ;; Quitting
  "qQ" 'evil-quit-all
  "qq" 'evil-quit
  ;; Git diffs and commits
  "gd" 'magit-diff
  "gs" 'magit-status
  "gc" 'magit-commit
  "gb" 'magit-blame
  "gl" 'magit-log
  "gp" 'magit-push
  "gu" 'magit-pull
  ;; Project navigation
  "P"  'hydra-projectile/body  ; This gives an extended menu 
  "pf" 'helm-projectile-find-file
  "pP" 'helm-projectile-switch-project
  "pa" 'helm-projectile-ag
  ;; Utilities
  "D" 'hydra-docker/body
  "ue" 'elisp-slime-nav-describe-elisp-thing-at-point
  "ut" '(lambda () (interactive) (multi-term-dedicated-toggle) (evil-insert-state))
  "uc" 'my/toggle-theme
  ;; I use this so often it sits on the top level
  ";" 'evilnc-comment-or-uncomment-lines
)

;; Normal mode keymap
(define-key evil-normal-state-map (kbd "M-a") 'avy-goto-char-timer)
(define-key evil-normal-state-map (kbd "M-l") 'avy-goto-line)
(define-key evil-normal-state-map (kbd "t") 'my/evil-insert-line-below)
(define-key evil-normal-state-map (kbd "T") 'my/evil-insert-line-above)

(provide 'my-evil-map)
