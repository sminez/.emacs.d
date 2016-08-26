;; All of my leader bindings so they can be loaded at the end
(evil-leader/set-key
  ;; Find things
  "<SPC>" 'which-key-show-top-level
  "x" 'helm-M-x
  "b" 'helm-mini
  "s" 'helm-swoop
  "f" 'helm-find
  "o" 'helm-find-files
  ;; Selections
  "v" 'evil-visual-line
  "c" 'evil-visual-block
  ;; File / system tasks
  "w" 'save-buffer
  "Q" 'evil-quit-all
  "q" 'evil-quit
  "dw" 'evil-window-delete
  "db" 'kill-buffer
  ";" 'evilnc-comment-or-uncomment-lines
  "t" 'multi-term-dedicated-open
  ;; Create and navigate splits
  "/" 'split-window-right
  "<right>" 'evil-window-right
  "<left>" 'evil-window-left
  "<up>" 'evil-window-up
  "<down>" 'evil-window-down
  ;; Git diffs and commits
  "gd" 'magit-diff
  "gs" 'magit-status
  "gc" 'magit-commit
  "gb" 'magit-blame
  "gl" 'magit-log
  "gp" 'magit-push
  "gu" 'magit-pull
  ;; These bindings are for use inside of a Python project
  ;; Should probably make them mode specific at somepoint
  "pf" 'helm-projectile-find-file
  "pa" 'helm-projectile-ag
  "pd" 'anaconda-mode-find-definitions
  "p?" 'anaconda-mode-show-doc
  "pv" 'anaconda-mode-find-assignments
)

(provide 'my-leader-map)
