;; All of my leader bindings so they can be loaded at the end

;; RETHINK::
;; Move things into a kind of namespace based on the first letter:
;; (Totally stolen from Spacemacs)
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
  "ut" 'multi-term-dedicated-open
  ;; I use this so often it sits on the top level
  ";" 'evilnc-comment-or-uncomment-lines
)

;; Bindings didn't seem to works in my-ui.el
(define-key evil-normal-state-map (kbd "M-a") 'avy-goto-char-timer)
(define-key evil-normal-state-map (kbd "M-l") 'avy-goto-line)

(provide 'my-leader-map)
