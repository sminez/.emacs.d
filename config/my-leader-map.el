;; All of my leader bindings so they can be loaded at the end

;; RETHINK::
;; Move things into a kind of namespace based on the first letter:
;; (Totally stolen from Spacemacs)
;; f -> [f]iles
;; b -> [b]uffers
;; w -> [w]indows
;; g -> [g]it
;; o -> [o]rg mode
;; p -> [p]roject
;; s -> [s]earch
;; m -> [m]ajor mode
;; t -> [t]oggles
;; r -> [r]epl? (needs to be better...)
;;   a helm-ag
;;   f helm-find-files
;;   F helm-find
;;   s helm-swoop
;;   i helm-semantic-or-imenu

;; (evil-leader/set-key
;;   ;; Show key bindings and commands
;;   "<SPC>" 'which-key-show-top-level
;;   "x" 'helm-M-x
;;   ;; Files
;;   "fo" 'helm-find-files
;;   "fs" 'save-buffer
;;   ;; Buffers
;;   "bb" 'helm-mini
;;   "bk" 'kill-buffer
;;   ;; Search and Docs
;;   "sa" 'helm-apt
;;   "se" 'elisp-slime-nav-describe-elisp-thing-at-point
;;   "sf" 'helm-find
;;   "si" 'helm-semantic-or-imenu
;;   "ss" 'helm-swoop
;;   ;; Selections
;;   "vv" 'evil-visual-line
;;   "vc" 'evil-visual-block
;;   ;; Windows
;;   "w/" 'split-window-right
;;   "wh" 'evil-window-left
;;   "wj" 'evil-window-down
;;   "wk" 'evil-window-up
;;   "wl" 'evil-window-right
;;   ;; Quitting
;;   "qQ" 'evil-quit-all
;;   "qq" 'evil-quit
;;   "dw" 'evil-window-delete
;;   ";" 'evilnc-comment-or-uncomment-lines
;;   "t" 'multi-term-dedicated-open
;;   ;; Git diffs and commits
;;   "gd" 'magit-diff
;;   "gs" 'magit-status
;;   "gc" 'magit-commit
;;   "gb" 'magit-blame
;;   "gl" 'magit-log
;;   "gp" 'magit-push
;;   "gu" 'magit-pull
;;   ;; Project navigation
;;   "pf" 'helm-projectile-find-file
;;   "pa" 'helm-projectile-ag
;; )

(evil-leader/set-key
  ;; Find things
  "<SPC>" 'which-key-show-top-level
  "x" 'helm-M-x
  "b" 'helm-mini
  "s" 'helm-swoop
  "f" 'helm-find
  "o" 'helm-find-files
  "e" 'elisp-slime-nav-describe-elisp-thing-at-point
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
  ;; Git diffs and commits
  "gd" 'magit-diff
  "gs" 'magit-status
  "gc" 'magit-commit
  "gb" 'magit-blame
  "gl" 'magit-log
  "gp" 'magit-push
  "gu" 'magit-pull
  ;; Project navigation
  "pf" 'helm-projectile-find-file
  "pa" 'helm-projectile-ag
)

(provide 'my-leader-map)
